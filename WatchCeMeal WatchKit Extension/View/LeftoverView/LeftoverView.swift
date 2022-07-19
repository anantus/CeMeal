//
//  LeftoverView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 17/07/22.
//

import SwiftUI

struct LeftoverView: View {
    
    @State private var allowNavigate = false
    @State private var searchQuery = ""
    @State private var selectedCategory = "Seafood & Seaweed"
    @State private var showAlert = false
    
    private var categories = ["Seafood & Seaweed", "A", "B", "C"]
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                // Search bar
                SearchBarView(allowNavigate: $allowNavigate, searchQuery: $searchQuery, showAlert: $showAlert)
                
                // Filter picker
                Picker("Filter", selection: $selectedCategory, content: {
                    ForEach(categories.indices, id: \.self) { i in
                        Text(categories[i])
                            .font(.caption2)
                            .tag(i)
                    }
                })
                .labelsHidden()
                .frame(height: 30)
                .id(0)

                // Item list
                ForEach(0..<10) { i in
                    NavigationLink(destination: {
                        LeftoverDetailView()
                    }, label: {
                        LeftoverListView(title: "Scallop \(i)", expiredDate: Date())
                    })
                }
                .onAppear() {
                    value.scrollTo(0)
                }

                .navigationTitle("Ingredients List")
                .navigationBarTitleDisplayMode(.inline)
                .alert("Search query can't be empty", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
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
