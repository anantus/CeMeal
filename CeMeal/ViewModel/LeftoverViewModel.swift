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
        getFridges()
    }
    
    func getFridges() {
        leftovers.removeAll()
        
        let newLeftovers = [
            Leftover(ingredientId: "123", buyDate: Date(), expireDate: Date(), storage: "Shelf", isChecked: true)
        ]
        
        leftovers.append(contentsOf: newLeftovers)
    }
    
    func leftoverIsChecked(leftover: Leftover) {
        if let index = leftovers.firstIndex(where: { $0.id == leftover.id }) {
            leftovers[index] = leftover.updateCheckmark()
        }
    }
    
}
