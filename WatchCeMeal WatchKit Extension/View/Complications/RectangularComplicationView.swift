//
//  RectangularComplicationView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 20/07/22.
//

import ClockKit
import SwiftUI

struct RectangularComplicationView: View {
    
    var qty: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Expired this week!")
                    .foregroundColor(.red)
                
                Text("\(qty) ingredients")
            }
            
            Spacer()
        }
    }
    
}

struct RectangularComplicationView_Previews: PreviewProvider {
    static var previews: some View {
        CLKComplicationTemplateGraphicRectangularFullView(RectangularComplicationView(qty: 15))
        .previewContext()
    }
}
