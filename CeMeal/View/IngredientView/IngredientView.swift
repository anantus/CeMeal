//
//  IngredientView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import SwiftUI

struct IngredientView: View {
    
    @ObservedObject private var ingredientViewModel = IngredientViewModel()
    @State private var searchQuery = ""
    @State private var sort: Int = 0
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                // Ingredient items
                if ingredientViewModel.ingredients.count != 0 {
                    
                    List {
                        // My ingredients title
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
                        .listRowBackground(Color(UIColor.systemGray6))
                        
                        // Filled ingredient list
                        ForEach(ingredientViewModel.ingredients.filter({ searchQuery.isEmpty ? true : $0.title.contains(searchQuery) })) { ingredient in
                            NavigationLink {
                                Text("Chicken Breast")
                            } label: {
                                IngredientListView(ingredient: ingredient)
                            }
                        }
                        .listRowBackground(Color(UIColor.systemGray6))
                    }
                    .listStyle(.plain)
                    .refreshable {
                        self.ingredientViewModel.getIngredients()
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
                
                Button {
                    
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
                    Button {
                        
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
        IngredientView()
            .previewInterfaceOrientation(.portrait)
    }
}
