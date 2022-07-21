//
//  SearchResultView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 18/07/22.
//

import SwiftUI

struct SearchResultView: View {
    
    var searchQuery: String
//    @Binding var model : ViewModelWatch
    
    var body: some View {
        VStack(alignment: .leading) {
            // Search title
            Text("Result for \"\(searchQuery)\"")
                .font(.headline)
            
            // Leftovers
            List {
//                if (model.leftovers.count != 0) {
//                    ForEach(0...model.leftovers.count-1, id: \.self){ index in
//
//                        let ingredients : String = model.leftovers[index]["ingredients"] as! String
//                        let expiredDate : Date = model.leftovers[index]["dateExpired"] as! Date
//                        let dateCreated : Date = model.leftovers[index]["dateCreated"] as! Date
//
//                        if ingredients.contains(searchQuery){
//                            NavigationLink(destination: {
//                                LeftoverDetailView(expiredDate: expiredDate, dateCreated: dateCreated)
//                            }, label: {
//                                LeftoverListView(title: ingredients , expiredDate: expiredDate, dateCreated: dateCreated)
//                            })
//                        }
//
//                    }
//                }
                //                NavigationLink(destination: {
                //                    LeftoverDetailView()
                //                }, label: {
                //                    LeftoverListView(title: "Scallop", expiredDate: Date(), dateCreated: Date())
                //                })
                //
                //                NavigationLink(destination: {
                //                    LeftoverDetailView()
                //                }, label: {
                //                    LeftoverListView(title: "Onion", expiredDate: Date(), dateCreated: Date())
                //                })
            }
        }
    }
}

//struct SearchResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultView(searchQuery: "Scallop")
//    }
//}
