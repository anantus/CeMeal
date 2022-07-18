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
                    NavigationLink(destination: {
                        LeftoverDetailView()
                    }, label: {
                        LeftoverListView(title: "Scallop", expiredDate: Date())
                    })
                    
                    NavigationLink(destination: {
                        LeftoverDetailView()
                    }, label: {
                        LeftoverListView(title: "Onion", expiredDate: Date())
                    })
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
