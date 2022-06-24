//
//  Ingredient.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import Foundation

struct Ingredient: Identifiable {
    
    var id = UUID()
    var title: String
    var qty: Float
    var category: String
    var buyDate: Date
    var unit: String
    var isChecked: Bool
    
    func updateCheckmark() -> Ingredient {
        return Ingredient(id: id, title: title, qty: qty, category: category, buyDate: buyDate, unit: unit, isChecked: !isChecked)
    }
    
}
