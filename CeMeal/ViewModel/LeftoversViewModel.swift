//
//  IngredientsViewModel.swift
//  CeMeal
//
//  Created by Maheswara Ananta Argono on 28/06/22.
//

import Foundation
import SwiftUI
import Combine
import CoreData

class LeftoversViewModel:ObservableObject{
    @Published var ingredients = ""
    @Published var storage = ""
    @Published var category = ""
    @Published var reminder = ""
    //TODO: implement dateExpired
    @Published var dateCreated = Date()
    @Published var dateExpired = Date()
    @Published var isChecked = false
    @Published var isUsed = false
    @Published var leftoverItem:Leftovers!
    
    func createLeftovers(context:NSManagedObjectContext){
        if leftoverItem == nil {
            let leftover = Leftovers(context: context)
            leftover.id = UUID()
            leftover.ingredients = ingredients
            leftover.storage = storage
            leftover.category = category
            leftover.reminder = reminder
            leftover.dateCreated = dateCreated
            leftover.dateExpired = dateExpired
            leftover.isChecked = isChecked
            leftover.isUsed = isUsed
        }
        else{
            leftoverItem.ingredients = ingredients
        }
        save(context: context)
        ingredients = ""
    }
    
    func editLeftovers(ingredient:Leftovers){
        leftoverItem = ingredient
    }
    
    func delete(ingredient:Leftovers, context:NSManagedObjectContext){
        context.delete(ingredient)
        save(context: context)
    }
    
    func checkLeftovers(ingredient:Leftovers, context:NSManagedObjectContext){
        ingredient.isChecked.toggle()
        save(context: context)
    }
    
    func usedLeftovers(ingredient:Leftovers, context:NSManagedObjectContext){
        ingredient.isUsed.toggle()
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
