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
//    @ObservedObject var model = ViewModelWatch()
    @ObservedObject var leftoverVM = LeftoverViewModel()
    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                // Search bar
//                SearchBarView(allowNavigate: $allowNavigate, searchQuery: $searchQuery, showAlert: $showAlert, model: .constant(model))
                
                // Filter picker
//                Picker("Filter", selection: $selectedCategory, content: {
//                    ForEach(model.categories.indices, id: \.self) { i in
//                        Text(model.categories[i])
//                            .font(.caption2)
//                            .tag(model.categories[i])
//                    }
//                })
//                .labelsHidden()
//                .frame(height: 30)
//                .id(0)
                
                // Item list
                if (leftoverVM.leftovers.count != 0) {
                    ForEach(leftoverVM.leftovers.filter({ selectedCategory == "All" ? true : $0.category.contains(selectedCategory) })) { leftover in
                            NavigationLink(destination: {
                                LeftoverDetailView(expiredDate: leftover.dateExpired, dateCreated: leftover.dateCreated)
                            }, label: {
                                LeftoverListView(title: leftover.ingredients, expiredDate: leftover.dateExpired, dateCreated: leftover.dateCreated)
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
                } else {
                    Text("Use your phone to add an ingredients!")
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
