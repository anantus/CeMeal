//
//  recipesViewModel.swift
//  CeMeal
//
//  Created by Maheswara Ananta Argono on 28/06/22.
//

import Foundation
import Combine
import CoreData

class FavoriteViewModel:ObservableObject{
    @Published var mealName = ""
    @Published var recipeItem:Favorites!
    
    func createFavorite(context:NSManagedObjectContext){
        if recipeItem == nil {
            let recipe = Favorites(context: context)
            recipe.id = UUID()
            recipe.mealName = mealName
            recipe.date = Date()
            
            
        }
        else{
            recipeItem.mealName = mealName
        }
        save(context: context)
        mealName = ""
    }
    
    func delete(recipe:Favorites, context:NSManagedObjectContext){
        context.delete(recipe)
        save(context: context)
    }
    
    func save(context:NSManagedObjectContext){
        do{
            try context.save()
        }
        catch{
            print(error)
        }
    }
}

