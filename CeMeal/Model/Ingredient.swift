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
    var category: String
    var expireDay: [Int]
    var shelfLife: [String:String]
    
    init(id: String = UUID().uuidString, title: String, category: String, expireDay: [Int], shelfLife: [String:String]) {
        self.id = id
        self.title = title
        self.category = category
        self.expireDay = expireDay
        self.shelfLife = shelfLife
    }
    
}
