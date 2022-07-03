//
//  Recipe.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import Foundation

struct Recipe : Identifiable {
    var mealName : String = ""
    var category : String = ""
    var area : String = ""
    var instructions : String = ""
    var thumbnail : String = ""
    var youtubeLink : String = ""
    var ingredients : [String] = []
    var measurements : [String] = []
    var source : String = ""
    var id = UUID()

    init(raw: [String]) {
        mealName = raw[1]
        category = raw[3]
        area = raw[4]
        instructions = raw[5]
        thumbnail = raw[6]
        youtubeLink = raw[8]
        source = raw[49]

        for ingr_measure_num in 1...20 {
            let ingredients_col : Int = 8 + ingr_measure_num
            let recipe_col : Int = 28 + ingr_measure_num
            
            if raw[ingredients_col].capitalized != ""{
                ingredients.append(raw[ingredients_col].capitalized)
            }
            
            if raw[recipe_col] != ""{
                measurements.append(raw[recipe_col])
            }
        }
    }
}

//struct Recipe: Identifiable {
//
//    var id: String
//    var title: String
//    var thumbnailImage: String?
//    var isFavorite: Bool
//
//    init(id: String = UUID().uuidString, title: String, thumbnailImage: String? = nil, isFavorite: Bool = false) {
//        self.id = id
//        self.title = title
//        self.thumbnailImage = thumbnailImage
//        self.isFavorite = isFavorite
//    }
//
//}
