//
//  Fridge.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 30/06/22.
//

import Foundation

struct Leftover: Identifiable {
    
    var id: String
    var ingredientId: String
    var buyDate: Date
    var expireDate: Date
    var storage: String
    var isChecked: Bool
    
    init(id: String = UUID().uuidString, ingredientId: String, buyDate: Date, expireDate: Date, storage: String, isChecked: Bool) {
        self.id = id
        self.ingredientId = ingredientId
        self.buyDate = buyDate
        self.expireDate = expireDate
        self.storage = storage
        self.isChecked = isChecked
    }
    
    func updateCheckmark() -> Leftover {
        return Leftover(id: id, ingredientId: ingredientId, buyDate: buyDate, expireDate: expireDate, storage: storage, isChecked: !isChecked)
    }
    
}
