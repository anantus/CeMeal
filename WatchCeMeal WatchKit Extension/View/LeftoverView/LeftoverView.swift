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
                .labelsHidden()
                .frame(height: 30)
                
                // Leftovers
                List {
                    VStack(alignment: .leading) {
                        Text("Scallop")
                        Text("Expired in 3 days")
                            .font(.footnote)
                            .foregroundColor(.red)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Onion")
                        Text("Expired on 22 Dec 2023")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            .navigationTitle("Ingredients List")
            .navigationBarTitleDisplayMode(.inline)
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
