//
//  Date.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 23/06/22.
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
