//
//  LeftoverView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import SwiftUI

struct LeftoverView: View {
    
    @Environment(\.managedObjectContext) private var viewContent
    @EnvironmentObject var leftoversViewModel:LeftoversViewModel
    @ObservedObject var ingredientVM:IngredientViewModel = IngredientViewModel()
    @State var reachable = false
    @State var ingredientCount = 0
    @FetchRequest(entity: Leftovers.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)]) var fetchedLeftovers:FetchedResults<Leftovers>
    
    @Environment(\.colorScheme) var colorScheme
    //    @ObservedObject private var leftoverViewModel = LeftoverViewModel()
    @State private var searchQuery = ""
    @State private var sort: Int = 0
    @State private var showAlert = false
    
    @State private var selectedIngredient: Ingredient?
    
    var model = ViewModelPhone()
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                // Ingredient items
                if fetchedLeftovers.count != 0 {
                    
                    List {
                        // My ingredients title & sort
                        HStack {
                            Text("My Ingredients")
                                .foregroundColor(Color.ui.title)
                                .font(.headline)
                            
                            Spacer()
                            
                            Menu {
                                Picker(selection: $sort, label: Text("Sorting options")) {
                                    Text("Title").tag(0)
                                    Text("Buy Date").tag(1)
                                }
                            }
                        label: {
                            Image(systemName: "arrow.up.arrow.down")
                                .foregroundColor(.accentColor)
                        }
                        }
                        .listRowBackground(colorScheme == .light ? .white : Color(UIColor.systemGray6))
                        
                        // Filled ingredient list
                        ForEach(fetchedLeftovers.filter({ searchQuery.isEmpty ? true : $0.ingredients!.contains(searchQuery) })) { leftover in
                            Button {
                            } label: {
                                HStack {
                                    // Checkbox
                                    Image(systemName: leftover.isChecked ? "checkmark.square.fill" : "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .onTapGesture {
                                            withAnimation(.easeOut) {
                                                if Date() > leftover.dateExpired! && leftover.isChecked == false {
                                                    showAlert.toggle()
                                                }
                                                
                                                leftoversViewModel.checkLeftovers(ingredient: leftover, context: viewContent)
                                            }
                                        }
                                        .foregroundColor(.accentColor)
                                    
                                    // Content
                                    
                                    Button {
                                        selectedIngredient = findIngredient(leftover: leftover)
                                    } label: {
                                        LeftoverListView(leftover: leftover)
                                    }
                                }
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: false){
                                //role destructive add red color and delete animation
                                Button(role: .destructive, action: {
                                    leftoversViewModel.delete(ingredient: leftover, context: viewContent)
                                }, label: {
                                    Label("Delete", systemImage: "trash")
                                })
                            }
                            .padding(.horizontal)
                        }
                        .sheet(item: $selectedIngredient ) { item in
                            IngredientDetailView(isEdit: true, ingredient: item)
                        }
                        .listRowBackground(colorScheme == .light ? .white : Color(UIColor.systemGray6))
                    }
                    .listStyle(.plain)
                    
                } else {
                    
                    // Empty ingredient list
                    VStack(alignment: .center) {
                        Image("NoIngredient")
                        Text("No ingredient")
                            .foregroundColor(Color.ui.title)
                            .padding(.top)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
                
                
                NavigationLink {
                    GenerateRecipeView()
                } label: {
                    Text("Generate Recipe")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.ui.buttonLabel)
                }
                .buttonStyle(NeumorphicButtonStyle(bgColor: .accentColor))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom)
            }
            
            
            .navigationTitle("Hi, Chef!")
            .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    NavigationLink {
                        AddIngredientView()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Check Before Using!"),
                    message: Text("This ingredient is past its estimated expired date."),
                    dismissButton: .destructive(Text("Got It!"))
                )
            }
            .onAppear{
                while (reachable == false && ingredientCount != fetchedLeftovers.count) {
                    sendMessage()
                }
            }
        }
    }
    
    func findIngredient(leftover : Leftovers) -> Ingredient{
        var leftoverIngredient : Ingredient?
        for i in ingredientVM.ingredients{
            if i.ingredientName == leftover.ingredients{
                leftoverIngredient = i
                return leftoverIngredient!
            }
        }
        return leftoverIngredient!
    }
    
    func sendMessage() {
        var allLeftover : [[String : Any]] = []
        var categories : [String] = []
        
        for leftover in fetchedLeftovers{
            let tempLeftover : [String: Any] =
            ["category":  leftover.category ?? "No Category",
             "dateCreated": leftover.dateCreated ?? Date(),
             "dateExpired": leftover.dateExpired ?? Date(),
             "ingredients": leftover.ingredients!]
            
            allLeftover.append(tempLeftover)
            categories.append(leftover.category ?? "No Category")
        }
        
        var uniqueCat = Array(Set(categories))
        uniqueCat.sort()
        uniqueCat.insert("All", at: 0)
        
        
        // MARK: Send message menggunakan WCSession
        let dataMessage = ["leftovers": allLeftover, "categories": uniqueCat] as [String : Any]
        
        if model.wcSession.isReachable {
            reachable = true
            ingredientCount = allLeftover.count
        } else {
            reachable = false
        }
        
        model.wcSession.sendMessage(dataMessage, replyHandler: nil)
    }
    
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        LeftoverView()
    }
}
