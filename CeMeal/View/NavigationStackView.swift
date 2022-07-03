//
//  NavigationStackView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 03/07/22.
//

import SwiftUI

//// MARK: - SessionManager
//class SessionManager: ObservableObject {
//    var isLoggedIn: Bool = false {
//        didSet {
//            rootId = UUID()
//        }
//    }
//
//    @Published
//    var rootId: UUID = UUID()
//}

// MARK: - ContentView
struct NavigationStackView: View {
    @ObservedObject
    private var sessionManager = SessionManager()
    var body: some View {
        NavigationView {
            NavigationLink("ContentViewTwo", destination: ContentViewTwo().environmentObject(sessionManager))
        }.id(sessionManager.rootId)
    }
}

// MARK: - ContentViewTwo
struct ContentViewTwo: View {
    @EnvironmentObject
    var sessionManager: SessionManager
    
    var body: some View {
        NavigationLink("ContentViewTwo", destination: ContentViewThree().environmentObject(sessionManager))
    }
}

// MARK: - ContentViewThree
struct ContentViewThree: View {
    @EnvironmentObject
    var sessionManager: SessionManager
    
    var body: some View {
        NavigationLink("ContentViewThree", destination: ContentViewFour().environmentObject(sessionManager))
    }
}

// MARK: - ContentViewFour
struct ContentViewFour: View {
    @EnvironmentObject
    var sessionManager: SessionManager
    
    var body: some View {
        Button(action: {
            sessionManager.isLoggedIn.toggle()
        }, label: {
            Text("logout")
        })
    }
}

struct NavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackView()
    }
}
