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
    
    var body: some View {
        NavigationView {
            List(recipeViewModel.recipes) { recipe in
                NavigationLink(destination: {
                    Text(recipe.title)
                }, label: {
                    RecipeListView(recipe: recipe)
                })
            }
            .listStyle(.plain)
            
            .navigationTitle("Favorites")
            .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
            .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
        }
        
    }
}

#if DEBUG
struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
#endif
