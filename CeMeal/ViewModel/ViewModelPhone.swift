//
//  ViewModelPhone.swift
//  CeMeal
//
//  Created by Maheswara Ananta Argono on 20/07/22.
//

import Foundation

import WatchConnectivity

class ViewModelPhone: NSObject {
    
    var wcSession: WCSession
    
    // Init session and activate watch connectivity
    init(session: WCSession = .default) {
        self.wcSession = session
        super.init()
        self.wcSession.delegate = self
        session.activate()
    }
    
}

extension ViewModelPhone: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
    }
    
}

