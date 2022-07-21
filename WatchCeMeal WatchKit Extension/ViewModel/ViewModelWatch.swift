//
//  ViewModelWatch.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Maheswara Ananta Argono on 20/07/22.
//

import SwiftUI
import WatchConnectivity

class LeftoverViewModel: NSObject, ObservableObject {
    
    @Published var leftovers: [Leftover] = [] {
        didSet {
            saveItems()
        }
    }
    
    var wcSession: WCSession
    let itemsKey: String = "items_list"
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Leftover].self, from: data)
        else { return }
        
        self.leftovers = savedItems
    }
    
    func createLeftover(newLeftovers: [[String: Any]]) {
        leftovers.removeAll()
        
        for leftover in newLeftovers {
            let newLeftover = Leftover(id: UUID().uuidString, ingredients: leftover["ingredients"] as! String, category: leftover["category"] as! String, dateCreated: leftover["dateCreated"] as! Date, dateExpired: leftover["dateExpired"] as! Date)
            leftovers.append(newLeftover)
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(leftovers) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    func filterCategories() -> [String] {
        var categories = ["All"]
        
        for leftover in leftovers {
            if !categories.contains(leftover.category) {
                categories.append(leftover.category)
            }
        }
        
        return categories
    }
    
    // Init session and activate watch connectivity
    // alat komunikasi buat watch
    init(session: WCSession = .default) {
        self.wcSession = session
        super.init()
        self.wcSession.delegate = self
        session.activate()

        getItems()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // MARK: Capture data
        DispatchQueue.main.async {
            self.createLeftover(newLeftovers: message["leftovers"] as! [[String: Any]])
        }
    }
    
}

extension LeftoverViewModel: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}
}
