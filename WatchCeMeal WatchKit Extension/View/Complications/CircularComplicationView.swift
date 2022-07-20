//
//  CircularComplicationView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 20/07/22.
//

import ClockKit
import SwiftUI

struct CircularComplicationView: View {
    
    var qty: Int
    
    var body: some View {
        ZStack {
            Image("ComplicationVector")
                .resizable()
                .frame(width: 36.86, height: 44)
            
            Text("\(qty)")
                .font(.body)
                .foregroundColor(.red)
                .padding(.top)
        }
    }
}

struct CircularComplicationView_Previews: PreviewProvider {
    static var previews: some View {
        CLKComplicationTemplateGraphicCircularView(CircularComplicationView(qty: 15))
            .previewContext()
    }
}
