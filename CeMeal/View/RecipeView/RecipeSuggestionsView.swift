//
//  RecipeSuggestionsView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

struct RecipeSuggestionsView: View {
    
    @ObservedObject private var recipeViewModel = RecipeViewModel()
    @FetchRequest(entity: Leftovers.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)]) var fetchedLeftovers:FetchedResults<Leftovers>
    
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
                    RecipeListView(recipe: recipe, countIngredient: countCheckIngredient())
                })
            }
            .listStyle(.plain)
        }
    }
    
    func countCheckIngredient() -> Int{
        var checkedIngredients : [String] = []
        for i in fetchedLeftovers{
            if i.isChecked{
                checkedIngredients.append(i.ingredients ?? "Invalid Ingredients")
            }
        }
        return checkedIngredients.count
    }
}

struct RecipeSuggestionsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSuggestionsView()
    }
}
