//
//  Recipe.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import Foundation

struct Recipe: Identifiable {
    
    var id: String
    var title: String
    var thumbnailImage: String?
    var isFavorite: Bool
    
    init(id: String = UUID().uuidString, title: String, thumbnailImage: String? = nil, isFavorite: Bool = false) {
        self.id = id
        self.title = title
        self.thumbnailImage = thumbnailImage
        self.isFavorite = isFavorite
    }
    
}
