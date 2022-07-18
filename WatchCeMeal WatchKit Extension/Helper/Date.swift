//
//  Date.swift
//  WatchCeMeal WatchKit Extension
//
//  Created by Darma Wiryanata on 18/07/22.
//

import Foundation

func dateToString(_ date: Date) -> String {
    // Create Date Formatter
    let dateFormatter = DateFormatter()

    // Set Date/Time Style
    dateFormatter.dateFormat = "dd MMM yyyy"
//    dateFormatter.dateStyle = .short
//    dateFormatter.timeStyle = .short

    // Convert Date to String
    return dateFormatter.string(from: date) // September 9, 2020 at 12:24 PM
}

func separatedDateMonth(_ date: Date) -> [String:String] {
    // Create Date Formatter
    let dayFormatter = DateFormatter()
    let monthYearFormatter = DateFormatter()

    // Set Date/Time Style
    dayFormatter.dateFormat = "dd"
    monthYearFormatter.dateFormat = "MMM yyyy"

    // Convert Date to String
    let day = dayFormatter.string(from: date)
    let monthYear = monthYearFormatter.string(from: date)
    
    return [
        "day": day,
        "month": monthYear
    ]
}
