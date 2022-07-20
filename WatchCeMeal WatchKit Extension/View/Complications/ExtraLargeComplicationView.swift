//
//  ExtraLargeComplicationView.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 20/07/22.
//

import ClockKit
import SwiftUI

struct ExtraLargeComplicationView: View {
    
    var qty: Int
    
    var body: some View {
        ZStack {
            Image("ComplicationVector")
                .resizable()
                .frame(height: .infinity)
                .aspectRatio(contentMode: .fit)
                .complicationForeground()
            
            Text("\(qty)")
                .font(.largeTitle)
                .foregroundColor(.red)
                .complicationForeground()
                .padding(.top, 20)
        }
    }
    
}

struct ExtraLargeComplicationView_Previews: PreviewProvider {
    static var previews: some View {
        CLKComplicationTemplateGraphicExtraLargeCircularView(ExtraLargeComplicationView(qty: 15))
        .previewContext()
    }
}
