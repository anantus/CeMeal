//
//  RecipeView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

struct RecipeView: View {
    
    var recipe: Recipe
    
    var body: some View {
            ScrollView {
                // Recipe image
                Image(recipe.thumbnailImage ?? Image.ui.thumbnailImagePlaceholder)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .border(.blue)
                    .clipped()
                    .frame(width: .infinity, height: 250, alignment: .center)
                    .cornerRadius(10)
                    .padding(0)
                
                // Segmented control
            }
            
            .navigationTitle(recipe.title)
            .navigationBarColor(backgroundColor: .systemBackground, titleColor: UIColor(Color.ui.title))
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.accentColor)
                }
            }
    }
    
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeView(recipe: Recipe(title: "Nasi Goreng", isFavorite: true))
        }
    }
}
