//
//  LeftoverListView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 18/07/22.
//

import SwiftUI

struct LeftoverListView: View {
    
    var title: String
    var expiredDate: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            Text("Expired on \(dateToString(expiredDate))")
                .font(.footnote)
                .foregroundColor(.red)
        }
    }
}

struct LeftoverListView_Previews: PreviewProvider {
    static var previews: some View {
        LeftoverListView(title: "Scallop", expiredDate: Date())
    }
}
