//
//  ViewModelWatch.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Maheswara Ananta Argono on 20/07/22.
//

import SwiftUI
import WatchConnectivity

class ViewModelWatch: NSObject, ObservableObject {
    
    var wcSession: WCSession
    
    // Emoji & color
    @Published var leftovers : [[String: Any]] = []
    @Published var categories : [String] = []
    
    // Init session and activate watch connectivity
    // alat komunikasi buat watch
    init(session: WCSession = .default) {
        self.wcSession = session
        super.init()
        self.wcSession.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // MARK: Capture data
        DispatchQueue.main.async {
            self.leftovers = message["leftovers"] as! [[String: Any]]
            self.categories = message["categories"] as! [String]
            }
    }
    
}

extension ViewModelWatch: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
}
