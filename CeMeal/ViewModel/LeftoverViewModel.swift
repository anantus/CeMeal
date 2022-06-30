//
//  FridgeViewModel.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 30/06/22.
//

import Foundation

class LeftoverViewModel: ObservableObject {
    
    @Published var leftovers: [Leftover] = []
    
    init() {
        getLeftovers()
    }
    
    func getLeftovers() {
        leftovers.removeAll()
        
        let newLeftovers = [
            Leftover(title: "Chicken Breast", category: "Poultry", buyDate: Date(), expireDate: Date(), storage: "Shelf", isChecked: true)
        ]
        
        leftovers.append(contentsOf: newLeftovers)
    }
    
    func leftoverIsChecked(leftover: Leftover) {
        if let index = leftovers.firstIndex(where: { $0.id == leftover.id }) {
            leftovers[index] = leftover.updateCheckmark()
        }
    }
    
}
