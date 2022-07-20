//
//  CeMealApp.swift
//  CeMeal
//
//  Created by Maheswara Ananta Argono on 16/06/22.
//

import SwiftUI

@main
struct CeMealApp: App {
    
    @StateObject var leftoversViewModel = LeftoversViewModel()
    @StateObject var favoriteViewModel = FavoriteViewModel()
    @StateObject var addIngredientViewModel = AdditionalIngredientViewModel()
    @StateObject private var locationManager = LocationManager()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(leftoversViewModel)
                .environmentObject(favoriteViewModel)
                .environmentObject(addIngredientViewModel)
                .environmentObject(locationManager)
        }
    }
    
}
