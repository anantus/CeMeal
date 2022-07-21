//
//  SearchBarView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 19/07/22.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var allowNavigate: Bool
    @Binding var searchQuery: String
    @Binding var showAlert: Bool
    @Binding var model: ViewModelWatch
    
    var body: some View {
        ZStack {
            NavigationLink (destination: SearchResultView(searchQuery: searchQuery, model: $model), isActive: $allowNavigate) {}
            
            TextField("Search", text: $searchQuery)
                .submitLabel(.continue)
                .onSubmit {
                    checkSearchQuery()
                }
        }
    }
    
    func checkSearchQuery() {
        if searchQuery.isEmpty {
            showAlert.toggle()
        } else {
            allowNavigate.toggle()
        }
    }
    
}

//struct SearchBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarView(allowNavigate: .constant(false), searchQuery: .constant(""), showAlert: .constant(false))
//    }
//}
