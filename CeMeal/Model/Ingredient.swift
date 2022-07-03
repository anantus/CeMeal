//
//  Ingredient.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 22/06/22.
//

import Foundation

//struct Ingredient: Identifiable {
//    
//    var id: String
//    var title: String
//    var category: String
//    var expireDay: [Int]
//    var shelfLife: [String:String]
//    
//    init(id: String = UUID().uuidString, title: String, category: String, expireDay: [Int], shelfLife: [String:String]) {
//        self.id = id
//        self.title = title
//        self.category = category
//        self.expireDay = expireDay
//        self.shelfLife = shelfLife
//    }
//    
//}

struct Ingredient : Identifiable {
    var ingredientName : String = ""
    var category : String = ""
    var cupboard : String = ""
    var fridge : String = ""
    var freezer : String = ""
    var id = UUID()
    
    init(raw: [String]) {
        category = raw[0] == "" ? "No Category" : raw[0]
        ingredientName = raw[1].capitalized
        cupboard = raw[3]
        fridge = raw[4]
        freezer = raw[5]
    }
}
