//
//  CeMealApp.swift
//  CeMeal
//
//  Created by Maheswara Ananta Argono on 16/06/22.
//

import SwiftUI

@main
struct CeMealApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
