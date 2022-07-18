//
//  LeftoverDetailView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 18/07/22.
//

import SwiftUI

struct LeftoverDetailView: View {
    var body: some View {
        VStack {
            Spacer()
            
            ExpiredDateView(expiredDate: Date())
            
            Spacer()
            
            BuyDateView(buyDate: Date())
        }
    }
}

struct LeftoverDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LeftoverDetailView()
    }
}
