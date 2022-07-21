//
//  LeftoverDetailView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 18/07/22.
//

import SwiftUI

struct LeftoverDetailView: View {
    
    var expiredDate: Date
    var dateCreated: Date
    
    var body: some View {
        VStack {
            Spacer()
            
            ExpiredDateView(expiredDate: expiredDate, dateCreated: dateCreated)
            
            Spacer()
            
            BuyDateView(buyDate: dateCreated)
        }
    }
}

struct LeftoverDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LeftoverDetailView(expiredDate: Date(), dateCreated: Date())
    }
}
