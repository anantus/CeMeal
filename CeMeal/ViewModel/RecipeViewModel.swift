//
//  RecipeViewModel.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 25/06/22.
//

import SwiftUI

class RecipeViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    
    init() {
        getRecipes()
    }
    
    func getRecipes() {
        recipes.removeAll()
        
        let newRecipes = [
            Recipe(title: "Krispy Kreme Donut"),
            Recipe(title: "Croatian Bean Stew"),
            Recipe(title: "Apple Frangipan Tart")
        ]
        
        recipes.append(contentsOf: newRecipes)
    }
    
}

//struct Recipe : Identifiable {
//    var mealName : String = ""
//    var category : String = ""
//    var area : String = ""
//    var instructions : String = ""
//    var thumbnail : String = ""
//    var youtubeLink : String = ""
//    var ingredients : [String] = []
//    var measurements : [String] = []
//    var source : String = ""
//    var id = UUID()
//
//    init(raw: [String]) {
//        mealName = raw[1]
//        category = raw[3]
//        area = raw[4]
//        instructions = raw[5]
//        thumbnail = raw[6]
//        youtubeLink = raw[8]
//        source = raw[49]
//
//        for ingr_measure_num in 1...20 {
//            let ingredients_col : Int = 8 + ingr_measure_num
//            let recipe_col : Int = 28 + ingr_measure_num
//
//            ingredients.append(raw[ingredients_col])
//            measurements.append(raw[recipe_col])
//        }
//    }
//}
//
//func loadRecipeCSV(from csvName : String) -> [Recipes] {
//    var csvToStruct = [Recipes]()
//
//
//    //locate csv file
//    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
//        return []
//    }
//
//    //convert the contents of the file into one very long string
//    var data = ""
//    do {
//        data = try String(contentsOfFile: filePath)
//    } catch{
//        print(error)
//        return[]
//    }
//
//    //split the long string into an array of "rows" of data. Each row is a string
//    //detect "/n" carriage return, then split
//    var rows = data.components(separatedBy: "\n")
//
//    //remove header rows
//    //count the number of header columns before removing
//    let columnCount = rows.first?.components(separatedBy: ",").count
//    rows.removeFirst()
//
//    //now loop around each row and split into columns
//    for row in rows {
//        let csvColumns = row.components(separatedBy: ",")
//        if csvColumns.count == columnCount{
//            let recipeStruct = Recipes.init(raw: csvColumns)
//            csvToStruct.append(recipeStruct)
//        }
//    }
//
//    return csvToStruct
//}

