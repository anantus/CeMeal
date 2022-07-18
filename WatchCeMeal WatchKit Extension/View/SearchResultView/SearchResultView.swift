//
//  SearchResultView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 18/07/22.
//

import SwiftUI

struct SearchResultView: View {
    
    var searchQuery: String
    
    var body: some View {
        VStack(alignment: .leading) {
            // Search title
            Text("Result for \"\(searchQuery)\"")
                .font(.headline)
            
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
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(searchQuery: "Scallop")
    }
}
