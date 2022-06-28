//
//  RecipeSuggestionsView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

struct RecipeSuggestionsView: View {
    
    @ObservedObject private var recipeViewModel = RecipeViewModel()
    
    var body: some View {
        ScrollView {
            // Title
            Text("You might also like")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.ui.title)
                .multilineTextAlignment(.trailing)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

            
            // Recipes
            List(recipeViewModel.recipes) { recipe in
                NavigationLink(destination: {
                    RecipeView(recipe: recipe)
                }, label: {
                    RecipeListView(recipe: recipe)
                })
            }
            .listStyle(.plain)
        }
    }
}

struct RecipeSuggestionsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSuggestionsView()
    }
}
