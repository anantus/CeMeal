//
//  FavoriteView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

struct FavoriteView: View {
    
    @ObservedObject private var recipeViewModel = RecipeViewModel()
    @State private var searchQuery = ""
    
    @FetchRequest(entity: Leftovers.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)]) var fetchedLeftovers:FetchedResults<Leftovers>
    
    @Environment(\.managedObjectContext) private var viewContent

    @EnvironmentObject var favoriteVM:FavoriteViewModel
    @FetchRequest(entity: Favorites.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var fetchedFavorites:FetchedResults<Favorites>
    
    var body: some View {
        NavigationView {
            List(recipeViewModel.recipes) { recipe in
                if favoritesRecipeList().contains(recipe.mealName){
                    NavigationLink(destination: {
                        RecipeView(recipe: recipe)
                    }, label: {
                        RecipeListView(recipe: recipe, countIngredient: countCheckIngredient())
                    })
                }
            }
            .listStyle(.plain)
            
            .navigationTitle("Favorites")
            .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
            .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
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
    
    func favoritesRecipeList() -> [String]{
        var favoriteList : [String] = []
        for favorite in fetchedFavorites{
            favoriteList.append(favorite.mealName!)
        }
        return favoriteList
    }
    
}

#if DEBUG
struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
#endif
