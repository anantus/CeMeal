//
//  AdditionalIngredient.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 03/07/22.
//

import Foundation

struct AdditionalIngredient: Identifiable, Codable {
    
    var id: String
    var title: String
    
    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
}
