//
//  ContentView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 17/07/22.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        TabView {
            HomeView()
                .tag(0)
            
            LeftoverView()
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
