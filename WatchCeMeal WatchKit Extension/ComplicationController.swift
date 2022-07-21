//
//  ComplicationController.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 17/07/22.
//

import ClockKit
import SwiftUI

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Complication Configuration
    @ObservedObject var leftoverVM = LeftoverViewModel()

    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let descriptors = [
            CLKComplicationDescriptor(identifier: "complication", displayName: "CeMeal", supportedFamilies: CLKComplicationFamily.allCases)
            // Multiple complication support can be added here with more descriptors
        ]
        
        // Call the handler with the currently supported complication descriptors
        handler(descriptors)
    }
    
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }

    // MARK: - Timeline Configuration
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        handler(.showOnLockScreen)
    }

    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        if let template = getComplicationTemplate(for: complication) {
            let entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template)
            handler(entry)
        } else {
            handler(nil)
        }
    }
    
    func getComplicationTemplate(for complication: CLKComplication) -> CLKComplicationTemplate? {
        let leftoverQty = getQuantity()
        
        switch complication.family {
        case .graphicCorner:
            return CLKComplicationTemplateGraphicCornerTextView(
                textProvider: CLKTextProvider(format: "Exp this week!"),
                label: Text("\(leftoverQty)")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
            )
        case .graphicCircular:
            return CLKComplicationTemplateGraphicCircularView(CircularComplicationView(qty: leftoverQty))
        case .graphicRectangular:
            return CLKComplicationTemplateGraphicRectangularFullView(RectangularComplicationView(qty: leftoverQty))
        case .graphicExtraLarge:
            return CLKComplicationTemplateGraphicExtraLargeCircularView(ExtraLargeComplicationView(qty: leftoverQty))
        default:
            return nil
        }
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after the given date
        handler(nil)
    }

    // MARK: - Sample Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(nil)
    }
    
    func getQuantity() -> Int{
        var quantity = 0
        
        for leftover in leftoverVM.leftovers {
            if isExpiringInAWeek(lhs: leftover.dateCreated, rhs: leftover.dateExpired){
                quantity += 1
            }
        }
        
        return quantity
    }
    
    func isExpiringInAWeek(lhs: Date, rhs:Date) -> Bool  {
        let diffComponents = Calendar.current.dateComponents([.month, .day], from: lhs, to: rhs)
        let days = diffComponents.day!
//        let month = diffComponents.month!
        
        return (days >= 0 && days < 7)
    }
}
