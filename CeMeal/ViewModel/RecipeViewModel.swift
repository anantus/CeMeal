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
        recipes = loadRecipeCSV(from: "Recipes")
    }
    
//    func getRecipes() {
//        recipes.removeAll()
//
//        let newRecipes = [
//            Recipe(title: "Krispy Kreme Donut"),
//            Recipe(title: "Croatian Bean Stew"),
//            Recipe(title: "Apple Frangipan Tart")
//        ]
//
//        recipes.append(contentsOf: newRecipes)
//    }
    
}


func loadRecipeCSV(from csvName : String) -> [Recipe] {
    var csvToStruct = [Recipe]()


    //locate csv file
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
        return []
    }

    //convert the contents of the file into one very long string
    var data = ""
    do {
        data = try String(contentsOfFile: filePath)
    } catch{
        print(error)
        return[]
    }

    //split the long string into an array of "rows" of data. Each row is a string
    //detect "/n" carriage return, then split
    var rows = data.components(separatedBy: "\n")

    //remove header rows
    //count the number of header columns before removing
    let columnCount = rows.first?.components(separatedBy: "^").count
    rows.removeFirst()

    //now loop around each row and split into columns
    for row in rows {
        let csvColumns = row.components(separatedBy: "^")
        if csvColumns.count == columnCount{
            let recipeStruct = Recipe.init(raw: csvColumns)
            csvToStruct.append(recipeStruct)
        }
    }

    return csvToStruct
}

