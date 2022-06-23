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
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(ingredientViewModel.ingredients.filter({ searchQuery.isEmpty ? true : $0.title.contains(searchQuery) })) { ingredient in
                    NavigationLink {
                        Text("Chicken Breast")
                    } label: {
                        IngredientListView(ingredient: ingredient)
                    }
                }
            }
            .listStyle(.plain)
            
            .navigationTitle("Hi, Chef!")
            .navigationBarColor(backgroundColor: .white, titleColor: UIColor(Color.ui.title))
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
    }
}
