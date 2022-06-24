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
