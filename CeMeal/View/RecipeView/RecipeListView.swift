//
//  RecipeListView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

struct RecipeListView: View {
    
    var recipe: Recipe
    var countIngredient : Int
    
    var body: some View {
        HStack(alignment: .center) {
            // Checkbox
            AsyncImage(url: URL(string: recipe.thumbnail))
                .frame(width: 100, height: 100, alignment: .center)
                .clipped()
                .cornerRadius(10)
                .padding(0)
            
//            AsyncImage(
//                url: URL(string: recipe.thumbnail),
//                content: { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .border(.blue)
//                        .clipped()
//                        .frame(width: .infinity, height: 250, alignment: .center)
//                        .cornerRadius(10)
//                        .padding(0)
//                },
//                placeholder: {
//                    ProgressView()
//                }
//            )
            
//            Image(recipe.thumbnail)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 100, height: 100, alignment: .center)
//                .clipped()
//                .cornerRadius(10)
//                .padding(0)
            
            // Content
            VStack(alignment: .leading) {
                
                // Title
                Text(recipe.mealName)
                    .font(
                        .title3
                            .weight(.semibold)
                    )
                    .foregroundColor(Color.ui.title)
                    .textCase(.uppercase)
                    .multilineTextAlignment(.leading)
                
                // Category
                if countIngredient >= recipe.ingredients.filter(){$0 != "" && $0 != " "}.count{
                    Text("You have all the ingredients")
                        .foregroundColor(.accentColor)
                        .font(
                            .system(.callout, design: .serif)
                            .italic()
                        )
                        .multilineTextAlignment(.leading)
                }else{
                    Text("You are missing \(recipe.ingredients.filter(){$0 != "" && $0 != " "}.count - countIngredient) ingredients")
                        .foregroundColor(.red)
                        .font(
                            .system(.callout, design: .serif)
                            .italic()
                        )
                        .multilineTextAlignment(.leading)
                }
                
            }
            .padding(.horizontal, 8)
            
            Spacer()
            
            // Trailing chevron
            Image(systemName: "chevron.right")
                .foregroundColor(Color(UIColor.systemGray3))
                .font(.system(size: 16, weight: .semibold))
            
        }
        .padding(.vertical, 10)
    }
    
}

//struct RecipeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeListView(recipe: Recipe(title: "Nasi Goreng"))
//    }
//}
