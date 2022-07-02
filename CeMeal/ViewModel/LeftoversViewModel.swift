//
//  IngredientsViewModel.swift
//  CeMeal
//
//  Created by Maheswara Ananta Argono on 28/06/22.
//

import Foundation
import Combine
import CoreData

class LeftoversViewModel:ObservableObject{
    @Published var ingredientsName = ""
    @Published var storage = ""
    @Published var category = ""
    @Published var reminder = ""
    //TODO: implement dateExpired
    @Published var dateCreated = Date()
    @Published var dateExpired = Date()
    @Published var ingredientsItem:Leftovers!
    
    func createLeftovers(context:NSManagedObjectContext){
        if ingredientsItem == nil {
            let ingredient = Leftovers(context: context)
            ingredient.id = UUID()
            ingredient.ingredients = ingredientsName
            ingredient.storage = storage
            ingredient.category = category
            ingredient.reminder = reminder
            ingredient.dateCreated = dateCreated
            ingredient.dateExpired = dateExpired
        }
        else{
            ingredientsItem.ingredients = ingredientsName
        }
        save(context: context)
        ingredientsName = ""
    }
    
    func editLeftovers(ingredient:Leftovers){
        ingredientsItem = ingredient
    }
    
    func delete(ingredient:Leftovers, context:NSManagedObjectContext){
        context.delete(ingredient)
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
