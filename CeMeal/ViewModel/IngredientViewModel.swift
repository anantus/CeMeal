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
        let newIngredients = [
            Ingredient(title: "Chicken Breast", qty: 3, category: "Poultry", buyDate: Date(), unit: "gr", checked: true)
        ]
        
        ingredients.append(contentsOf: newIngredients)
    }
    
}
