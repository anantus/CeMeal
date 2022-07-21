//
//  Leftover.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 21/07/22.
//

import Foundation

struct Leftover: Codable, Identifiable {
    
    var id: String
    var ingredients: String
    var category: String
    var dateCreated: Date
    var dateExpired: Date
    
}
