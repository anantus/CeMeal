//
//  ExpiredDateView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 18/07/22.
//

import SwiftUI

struct ExpiredDateView: View {
    
    var expiredDate: Date
    
    var body: some View {
        VStack {
            Text("Expired Date".uppercased())
                .font(.caption2)
            
            Spacer()
            
            VStack {
                Text(separatedDateMonth(expiredDate)["day"]!)
                    .font(.system(size: 90, weight: .semibold))
                    .padding(-25)
                
                Text(separatedDateMonth(expiredDate)["month"]!.uppercased())
                    .font(.title3)
                
                Text("Expired in 3 days")
                    .font(.caption2)
            }
            .foregroundColor(.red)
        }
    }
    
}

struct ExpiredDateView_Previews: PreviewProvider {
    static var previews: some View {
        ExpiredDateView(expiredDate: Date())
    }
}
