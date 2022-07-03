//
//  AdditionalIngredientViewModel.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 03/07/22.
//

import Foundation

class AdditionalIngredientViewModel: ObservableObject {
    
    @Published var additionalIngredients = [AdditionalIngredient]() {
        didSet {
            saveAdditionalIngredient()
        }
    }
    
    init() {
        getAdditionalIngredients()
    }
    
    let itemsKey: String = "additional_ingredient_list"
    
    func saveAdditionalIngredient() {
        if let encodedData = try? JSONEncoder().encode(additionalIngredients) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    func getAdditionalIngredients() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([AdditionalIngredient].self, from: data)
        else { return }
        
        self.additionalIngredients = savedItems
    }
    
    func storeAdditionalIngredient(additionalIngredient: Ingredient) {
        let ingredientExist = additionalIngredients.filter({ $0.id == additionalIngredient.id }).first

        guard ingredientExist == nil else {
            return
        }
        
        let newAdditionalIngredient = AdditionalIngredient(id: additionalIngredient.id, title: additionalIngredient.title)
        additionalIngredients.append(newAdditionalIngredient)
    }
    
    func deleteAdditionalIngredient(id: String) {
        if let index = additionalIngredients.firstIndex(where: { $0.id == id }) {
            additionalIngredients.remove(at: index)
        }
        saveAdditionalIngredient()
    }
    
}
