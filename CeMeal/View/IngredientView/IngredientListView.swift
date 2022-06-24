//
//  IngredientListView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import SwiftUI

struct IngredientListView: View {
    
    var ingredient: Ingredient
    
    var body: some View {
        HStack {
            // Checkbox
            Image(systemName: ingredient.checked ? "checkmark.square.fill" : "square")
                .foregroundColor(.accentColor)
            
            // Content
            VStack(alignment: .leading) {
                
                // Title
                Text(ingredient.title)
                    .font(
                        .title3
                        .weight(.semibold)
                    )
                    .foregroundColor(Color.ui.title)
                    .textCase(.uppercase)
                
                // Category
                Text(ingredient.category)
                    .foregroundColor(.accentColor)
                    .font(
                        .system(.callout, design: .serif)
                        .italic()
                    )
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.accentColor)
                    
                    Text(dateToString(ingredient.buyDate))
                        .foregroundColor(.gray)
                    
                    Image(systemName: "plus.square.fill.on.square.fill")
                        .foregroundColor(.accentColor)
                    
                    Text(ingredient.qty.clean.description)
                        .foregroundColor(.gray)
                }
                .padding(.top, 1)
                
            }
            .padding(.horizontal, 16)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientListView(ingredient: Ingredient(title: "Chicken Breast", qty: 3, category: "Poultry", buyDate: Date(), unit: "gr", checked: true))
    }
}
