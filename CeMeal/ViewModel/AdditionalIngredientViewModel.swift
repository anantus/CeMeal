//
//  AdditionalIngredientViewModel.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 03/07/22.
//

import Foundation

class AdditionalIngredientViewModel: ObservableObject {
    
    @Published var additionalIngredients = [AdditionalIngredient]()
    
    init() {
        getAdditionalIngredients()
    }
    
    func getAdditionalIngredients() {
    }
    
    func storeAdditionalIngredient(additionalIngredient: Ingredient) -> AdditionalIngredient {
        let newAdditionalIngredient = AdditionalIngredient(id: additionalIngredient.id, title: additionalIngredient.title)
        additionalIngredients.append(newAdditionalIngredient)
        
        return newAdditionalIngredient
    }
    
}
