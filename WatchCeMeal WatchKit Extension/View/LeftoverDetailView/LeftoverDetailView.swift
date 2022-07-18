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
            
            ExpiredDateView()
            
            Spacer()
            
            BuyDateView()
        }
    }
}

struct LeftoverDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LeftoverDetailView()
    }
}

struct ExpiredDateView: View {
    var body: some View {
        Text("Expired Date".uppercased())
            .font(.caption2)
        
        Spacer()
        
        VStack {
            Text("21")
                .font(.system(size: 90, weight: .semibold))
                .padding(-25)
            
            Text("Jun 2022".uppercased())
                .font(.title3)
            
            Text("Expired in 3 days")
                .font(.caption2)
        }
        .foregroundColor(.red)
    }
}

struct BuyDateView: View {
    var body: some View {
        HStack {
            Text("Buy Date".uppercased())
            
            Spacer()
            
            Text("18 Jun 2022".uppercased())
                .foregroundColor(.gray)
        }
        .font(.caption2)
    }
}
