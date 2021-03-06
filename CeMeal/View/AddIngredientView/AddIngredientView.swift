//
//  AddIngredientView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 28/06/22.
//

import SwiftUI

struct AddIngredientView: View {
    
    @Environment(\.presentationMode) var addIngredient: Binding<PresentationMode>
    @ObservedObject var ingredientsViewModel = IngredientViewModel()
    @State private var searchQuery = ""
    @State private var showDetailSheet: Bool = false
    
    @FetchRequest(entity: Leftovers.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)]) var fetchedLeftovers:FetchedResults<Leftovers>
    
    @State private var isEdit:Bool = false
    @State private var selectedIngredient: Ingredient?
    
    var body: some View {
        Group {
            List(ingredientsViewModel.ingredients.filter({ searchQuery.lowercased().isEmpty ? true : $0.ingredientName.lowercased().contains(searchQuery.lowercased()) })) { ingredient in
                if !leftoverList().contains(ingredient.ingredientName){
                    Button {
                        selectedIngredient = ingredient
                    } label: {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .padding(.leading)
                            
                            Text("\(ingredient.ingredientName)")
                                .foregroundColor(.accentColor)
                        }
                    }
                    
                }
            }
            .sheet(item: $selectedIngredient) { item in
                IngredientDetailView(isEdit: false, ingredient: item)
            }
            .listStyle(.plain)
        }
        
        .navigationTitle("Add Ingredient")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    self.addIngredient.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
                
            }
        }
        .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    func leftoverList() -> [String]{
        var availableIngredient : [String] = []
        for lo in fetchedLeftovers{
            availableIngredient.append(lo.ingredients!)
        }
        return availableIngredient
    }
}

struct AddIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddIngredientView()
        }
    }
}
