//
//  GenerateRecipeView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 01/07/22.
//

import SwiftUI

struct GenerateRecipeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var recipeViewModel = RecipeViewModel()
    
//    @State private var moreIngredients = [String]()
    @State private var moreIngredients = ["Onion", "Garlic", "Chicken", "Apple"]
    
    var body: some View {
        List {
            // MARK: With your ingredients title
            RecipeSectionView(title: "With your ingredients", subtitle: "You have 7 ingredients", hasActionButton: false)
            
            // MARK: With your ingredients recipes
            ForEach(recipeViewModel.recipes) { recipe in
                NavigationLink {
                    RecipeView(recipe: recipe)
                } label: {
                    RecipeListView(recipe: recipe)
                }
            }
            
            // MARK: With more ingredients title
            RecipeSectionView(title: "With more ingredients", subtitle: nil, hasActionButton: true)
            
            // MARK: With more ingredients recipes
            ForEach(recipeViewModel.recipes) { recipe in
                NavigationLink {
                    RecipeView(recipe: recipe)
                } label: {
                    RecipeListView(recipe: recipe)
                }
            }
        }
        .listStyle(.plain)
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Text("Back")
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }
    
}

struct GenerateRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GenerateRecipeView()
        }
    }
}
