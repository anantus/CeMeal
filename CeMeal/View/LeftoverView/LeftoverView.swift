//
//  LeftoverView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import SwiftUI

struct LeftoverView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var leftoverViewModel = LeftoverViewModel()
    @State private var searchQuery = ""
    @State private var sort: Int = 0
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                // Ingredient items
                if leftoverViewModel.leftovers.count != 0 {
                    
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
                        ForEach(leftoverViewModel.leftovers.filter({ searchQuery.lowercased().isEmpty ? true : $0.title.lowercased().contains(searchQuery.lowercased()) })) { leftover in
                            Button {
//                                Text("Chicken Breast")
                            } label: {
                                LeftoverListView(leftover: leftover)
                            }
                        }
                        .onDelete(perform: leftoverViewModel.removeLeftOver)
                        .listRowBackground(colorScheme == .light ? .white : Color(UIColor.systemGray6))
                    }
                    .listStyle(.plain)
                    .refreshable {
                        self.leftoverViewModel.getLeftovers()
                    }
                    
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
        }
    }
    
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        LeftoverView()
    }
}
