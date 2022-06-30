//
//  IngredientViewModel.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import SwiftUI

class IngredientViewModel: ObservableObject {
    
    @Published var ingredients: [Ingredient] = []
    
    init() {
        getIngredients()
    }
    
    func getIngredients() {
        ingredients.removeAll()
        
        let newIngredients = [
            Ingredient(title: "Chicken Breast", category: "Poultry", expireDay: [90, 1, 1], shelfLife: [
                "Shelf": "1 month",
                "Fridge": "not recommended",
                "Freezer": "not recommended"
            ])
        ]
        
        ingredients.append(contentsOf: newIngredients)
    }
    
}
