//
//  Ingredient.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import Foundation

struct Ingredient: Identifiable {
    
    var id: String
    var title: String
    var qty: Float
    var category: String
    var buyDate: Date
    var unit: String
    var isChecked: Bool
    
    init(id: String = UUID().uuidString, title: String, qty: Float, category: String, buyDate: Date, unit: String, isChecked: Bool) {
        self.id = id
        self.title = title
        self.qty = qty
        self.category = category
        self.buyDate = buyDate
        self.unit = unit
        self.isChecked = isChecked
    }
    
    func updateCheckmark() -> Ingredient {
        return Ingredient(id: id, title: title, qty: qty, category: category, buyDate: buyDate, unit: unit, isChecked: !isChecked)
    }
    
}
