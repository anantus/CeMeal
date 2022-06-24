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
    var checked: Bool
    
}
