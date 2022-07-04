//
//  AdditionalIngredientViewModel.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 03/07/22.
//

import Foundation
import Combine
import CoreData

class AdditionalIngredientViewModel: ObservableObject{
    @Published var title = ""
    @Published var additionalIngredientItem:AdditionalIngredient!
    
    func storeAdditionalIngredient(context:NSManagedObjectContext){
        if additionalIngredientItem == nil {
            let addIng = AdditionalIngredient(context: context)
            addIng.id = UUID()
            addIng.title = title
        }
        else{
            additionalIngredientItem.title = title
        }
        save(context: context)
        title = ""
    }
    
    func deleteAdditionalIngredient(addIng: AdditionalIngredient, context:NSManagedObjectContext){
        context.delete(addIng)
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

//class AdditionalIngredientViewModel: ObservableObject {
//
//    @Published var additionalIngredients = [AdditionalIngredient]() {
//        didSet {
//            saveAdditionalIngredient()
//        }
//    }
//
////    init() {
////        getAdditionalIngredients()
////    }
//
//    let itemsKey: String = "additional_ingredient_list"
//
//    func saveAdditionalIngredient() {
//        if let encodedData = try? JSONEncoder().encode(additionalIngredients) {
//            UserDefaults.standard.set(encodedData, forKey: itemsKey)
//        }
//    }
//
//    func getAdditionalIngredients() -> [AdditionalIngredient] {
//        guard
//            let data = UserDefaults.standard.data(forKey: itemsKey),
//            let savedItems = try? JSONDecoder().decode([AdditionalIngredient].self, from: data)
//        else { return additionalIngredients}
//
//        self.additionalIngredients = savedItems
//
//        return additionalIngredients
//    }
//
//    func storeAdditionalIngredient(additionalIngredient: Ingredient) {
//        let ingredientExist = additionalIngredients.filter({ $0.id == additionalIngredient.id.uuidString }).first
////        let ingredientExist = additionalIngredients.first
//        guard ingredientExist == nil else {
//            return
//        }
//
//        let newAdditionalIngredient = AdditionalIngredient(id: additionalIngredient.id.uuidString, title: additionalIngredient.ingredientName)
//        additionalIngredients.append(newAdditionalIngredient)
//    }
//
//    func deleteAdditionalIngredient(id: String) {
//        if let index = additionalIngredients.firstIndex(where: { $0.id == id }) {
//            additionalIngredients.remove(at: index)
//        }
//        saveAdditionalIngredient()
//    }
//
//}
