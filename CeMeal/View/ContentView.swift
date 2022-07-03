//
//  ContentView.swift
//  CeMeal
//
//  Created by Maheswara Ananta Argono on 16/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var goToTabbedView: Bool = UserDefaults.standard.bool(forKey: "opened_once")
    
    var body: some View {
        if goToTabbedView {
            TabbedView()
        } else {
            OnboardingView(goToTabbedView: $goToTabbedView)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
