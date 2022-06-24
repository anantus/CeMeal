//
//  ContentView.swift
//  CeMeal
//
//  Created by Maheswara Ananta Argono on 16/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            IngredientView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Ingredient")
                }
                .tag(0)
            
            Text("Abc")
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
                .tag(1)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
