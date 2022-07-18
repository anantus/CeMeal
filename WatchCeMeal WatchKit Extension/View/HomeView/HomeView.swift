//
//  HomeView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 18/07/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchQuery = ""
    @State private var showAlert = false
    @State private var allowNavigate = false
    
    var body: some View {
        VStack {
            TextField("Type to search", text: $searchQuery)
            
            NavigationLink (destination: SearchResultView(searchQuery: searchQuery), isActive: $allowNavigate) {
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        checkSearchQuery()
                    }
            }
            .buttonStyle(.borderedProminent)
        }
        .alert("Search query can't be empty", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        }
        
        .navigationTitle("CeMeal")
    }
    
    func checkSearchQuery() {
        if searchQuery.isEmpty {
            showAlert.toggle()
        } else {
            allowNavigate.toggle()
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
