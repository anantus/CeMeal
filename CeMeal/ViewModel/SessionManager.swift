//
//  SessionManager.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 03/07/22.
//

import Foundation

class SessionManager: ObservableObject {
    var isLoggedIn: Bool = false {
        didSet {
            rootId = UUID()
        }
    }
    
    @Published
    var rootId: UUID = UUID()
}
