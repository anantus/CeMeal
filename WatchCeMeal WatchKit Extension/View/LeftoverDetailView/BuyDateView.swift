//
//  BuyDateView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 18/07/22.
//

import SwiftUI

struct BuyDateView: View {
    
    var buyDate: Date
    
    var body: some View {
        HStack {
            Text("Buy Date".uppercased())
            
            Spacer()
            
            Text(dateToString(buyDate).uppercased())
                .foregroundColor(.gray)
        }
        .font(.caption2)
    }
    
}

struct BuyDateView_Previews: PreviewProvider {
    static var previews: some View {
        BuyDateView(buyDate: Date())
    }
}
