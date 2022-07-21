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
    var dateCreated: Date
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                Text(computeNewDate(lhs:dateCreated ,rhs:expiredDate))
                    .font(.footnote)
                    .foregroundColor(colorDate(lhs: dateCreated, rhs: expiredDate))
            }
            
            Spacer()
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
            return "Expired on \(dateToString(rhs))"
        }
    }
    
    func colorDate(lhs: Date, rhs:Date) -> Color {
        let diffComponents = Calendar.current.dateComponents([.month, .day], from: lhs, to: rhs)
        if diffComponents.day! <= 7{
            return .red
        }else{
            return .green
        }
    }
}

struct LeftoverListView_Previews: PreviewProvider {
    static var previews: some View {
        LeftoverListView(title: "Scallop", expiredDate: Date(), dateCreated: Date())
    }
}
