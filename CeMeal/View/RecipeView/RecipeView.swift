//
//  RecipeView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

struct RecipeView: View {
    
    @State private var selectedMenu = 0
    
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
                Picker("Menu", selection: $selectedMenu, content: {
                    Group {
                        Text("Ingredients")
                    }
                    .tag(0)
                    VStack {
                        Text("Directions")
                    }
                    .tag(1)
                    VStack {
                        Text("Might Like")
                    }
                    .tag(2)
                })
                .pickerStyle(.segmented)
                .padding()
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
