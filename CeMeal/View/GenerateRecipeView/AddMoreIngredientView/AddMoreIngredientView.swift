//
//  AddMoreIngredientView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 01/07/22.
//

import SwiftUI

struct AddMoreIngredientView: View {
    
    @Environment(\.presentationMode) var addIngredient: Binding<PresentationMode>
    @ObservedObject var additionalIngredientsViewModel = AdditionalIngredientViewModel()
    @ObservedObject var ingredientsViewModel = IngredientViewModel()
    @State private var searchQuery = ""

    var body: some View {
        Group {
            List(ingredientsViewModel.ingredients.filter({ searchQuery.isEmpty ? true : $0.ingredientName.contains(searchQuery) })) { ingredient in
                Button {
                    additionalIngredientsViewModel.storeAdditionalIngredient(additionalIngredient: ingredient)
                    addIngredient.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading)
                        
                        Text("\(ingredient.ingredientName)")
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .listStyle(.plain)
        }
        
        .navigationTitle("Add More Ingredient")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
        .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
    }
    
}

struct AddMoreIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddMoreIngredientView()
        }
    }
}
