//
//  SearchResultView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 18/07/22.
//

import SwiftUI

struct SearchResultView: View {
    
    @ObservedObject var leftoverVM = LeftoverViewModel()
    
    var searchQuery: String
    
    var body: some View {
        VStack(alignment: .leading) {
            // Search title
            Text("Result for \"\(searchQuery)\"")
                .font(.headline)
            
            // Leftovers
            if (!leftoverVM.leftovers.filter({ $0.ingredients.contains(searchQuery) }).isEmpty) {
                
                List {
                    ForEach(leftoverVM.leftovers.filter({ $0.ingredients.contains(searchQuery) })) { leftover in

                        let ingredients = leftover.ingredients
                        let expiredDate = leftover.dateExpired
                        let dateCreated = leftover.dateCreated

                        if ingredients.contains(searchQuery){
                            NavigationLink(destination: {
                                LeftoverDetailView(expiredDate: expiredDate, dateCreated: dateCreated)
                            }, label: {
                                LeftoverListView(title: ingredients , expiredDate: expiredDate, dateCreated: dateCreated)
                            })
                        }
                    }
                }
                
            } else {
                Text("No items found")
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(searchQuery: "A")
    }
}
