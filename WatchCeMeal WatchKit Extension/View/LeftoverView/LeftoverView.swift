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
    @State private var selectedCategory = "All"
    @State private var showAlert = false
    @ObservedObject var model = ViewModelWatch()
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                // Search bar
                SearchBarView(allowNavigate: $allowNavigate, searchQuery: $searchQuery, showAlert: $showAlert, model: .constant(model))
                
                // Filter picker
                Picker("Filter", selection: $selectedCategory, content: {
                    ForEach(model.categories.indices, id: \.self) { i in
                        Text(model.categories[i])
                            .font(.caption2)
                            .tag(i)
                    }
                })
                .labelsHidden()
                .frame(height: 30)
                .id(0)
                
                // Item list
                if (model.leftovers.count != 0) {
                    ForEach(0...model.leftovers.count-1, id: \.self){ index in
                        
                        NavigationLink(destination: {
                            LeftoverDetailView(expiredDate: model.leftovers[index]["dateExpired"] as! Date, dateCreated: model.leftovers[index]["dateCreated"] as! Date)
                        }, label: {
                            LeftoverListView(title: model.leftovers[index]["ingredients"] as! String, expiredDate: model.leftovers[index]["dateExpired"] as! Date, dateCreated:  model.leftovers[index]["dateCreated"] as! Date)
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
}

struct LeftoverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LeftoverView()
        }
    }
}
