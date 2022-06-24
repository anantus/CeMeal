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
            Ingredient(title: "Chicken Breast", qty: 3, category: "Poultry", buyDate: Date(), unit: "gr", isChecked: true)
        ]
        
        ingredients.append(contentsOf: newIngredients)
    }
    
    func ingredientIsChecked(ingredient: Ingredient) {
        if let index = ingredients.firstIndex(where: { $0.id == ingredient.id }) {
            ingredients[index] = ingredient.updateCheckmark()
        }
    }
    
}
