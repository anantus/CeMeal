//
//  Float.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 23/06/22.
//

import Foundation

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
