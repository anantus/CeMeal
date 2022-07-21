//
//  ExpiredDateView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 18/07/22.
//

import SwiftUI

struct ExpiredDateView: View {
    
    var expiredDate: Date
    var dateCreated: Date
    
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
                
                Text(computeNewDate(lhs: dateCreated, rhs: expiredDate))
                    .font(.caption2)
            }
            .foregroundColor(.red)
        }
    }
    
    func computeNewDate(lhs: Date, rhs:Date) -> String  {
        let diffComponents = Calendar.current.dateComponents([.month, .day], from: lhs, to: rhs)
        let days = diffComponents.day
        let month = diffComponents.month
        if month! > 0 {
            return "Expire on \(String(describing: month)) month"
        }else if days! > 0 {
            return "Expire on \(String(days!)) days"
        }else if days == 0 {
            return "Expire Today!"
        }else{
            return "Ingredient has Expired!"
        }
    }
    
}

struct ExpiredDateView_Previews: PreviewProvider {
    static var previews: some View {
        ExpiredDateView(expiredDate: Date(), dateCreated: Date())
    }
}
