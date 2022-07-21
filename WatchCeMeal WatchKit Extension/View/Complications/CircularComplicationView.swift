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
                .frame(height: .infinity)
                .aspectRatio(contentMode: .fit)
                .complicationForeground()
            
            Text("\(qty)")
                .font(.body)
                .foregroundColor(.red)
                .complicationForeground()
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
