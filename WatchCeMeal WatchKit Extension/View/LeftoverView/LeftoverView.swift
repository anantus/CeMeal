//
//  LeftoverView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 17/07/22.
//

import SwiftUI

struct LeftoverView: View {
    
    @State private var selectedCategory = "Seafood & Seaweed"
    
    private var categories = ["Seafood & Seaweed", "A", "B", "C"]
    
    var body: some View {
        NavigationView {
            // Filter picker
            VStack {
                Picker("Filter", selection: $selectedCategory, content: {
                    ForEach(categories.indices, id: \.self) { i in
                        Text(categories[i])
                            .font(.caption2)
                            .tag(i)
                    }
                })
                .frame(height: 40)
            }
            
            .navigationTitle("Ingredients List")
        }
    }
    
}

struct LeftoverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LeftoverView()
        }
    }
}
