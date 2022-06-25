//
//  RecipeListView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

struct RecipeListView: View {
    
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center) {
            // Checkbox
            Image(recipe.thumbnailImage ?? "NoIngredient")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100, alignment: .center)
                .clipped()
                .cornerRadius(10)
                .padding(0)
            
            // Content
            VStack(alignment: .leading) {
                
                // Title
                Text(recipe.title)
                    .font(
                        .title3
                            .weight(.semibold)
                    )
                    .foregroundColor(Color.ui.title)
                    .textCase(.uppercase)
                
                // Category
                Text("You have all the ingredients")
                    .foregroundColor(.accentColor)
                    .font(
                        .system(.callout, design: .serif)
                        .italic()
                    )
                
            }
            .padding(.horizontal, 8)
            
        }
        .padding(.vertical, 10)
    }
    
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView(recipe: Recipe(title: "Nasi Goreng"))
    }
}
