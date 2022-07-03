//
//  GenerateRecipeView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 01/07/22.
//

import SwiftUI

struct GenerateRecipeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var additionalIngredientViewModel = AdditionalIngredientViewModel()
    @ObservedObject var recipeViewModel = RecipeViewModel()
    
//    @State private var moreIngredients = [String]()
    @State private var moreIngredients = ["Onion", "Garlic", "Chicken", "Apple"]
    
    var body: some View {
        ScrollView {
            // MARK: With your ingredients title
            RecipeSectionView(title: "With your ingredients", subtitle: "You have 7 ingredients", hasActionButton: false)
                .padding(.horizontal)
                .padding(.top)
            Divider()
            
            // MARK: With your ingredients recipes
            ForEach(recipeViewModel.recipes) { recipe in
                NavigationLink {
                    RecipeView(recipe: recipe)
                } label: {
                    RecipeListView(recipe: recipe)
                }
                .padding(.horizontal)
                Divider()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(colorScheme == .light ? .white : Color(UIColor.systemGray6))
            
            // MARK: With more ingredients title
            RecipeSectionView(title: "With more ingredients", subtitle: nil, hasActionButton: true)
                .padding(.horizontal)
            Divider()
            
            // MARK: More ingredients badges
            if additionalIngredientViewModel.additionalIngredients.count > 0 {
                ScrollView(.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(additionalIngredientViewModel.additionalIngredients) { ingredient in
                            CapsuleView(ingredient: ingredient)
                        }
                    }
                }
                .padding(.horizontal)
                Divider()
            }
            
            // MARK: With more ingredients recipes
            ForEach(recipeViewModel.recipes) { recipe in
                NavigationLink {
                    RecipeView(recipe: recipe)
                } label: {
                    RecipeListView(recipe: recipe)
                }
                .padding(.horizontal)
                Divider()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(colorScheme == .light ? .white : Color(UIColor.systemGray6))
        .refreshable {
            additionalIngredientViewModel.getAdditionalIngredients()
        }
        
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
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    additionalIngredientViewModel.getAdditionalIngredients()
                }) {
                    Image(systemName: "arrow.clockwise")
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
