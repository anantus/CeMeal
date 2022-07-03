//
//  OnboardingViewModel.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 03/07/22.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    @Published var contents = [Onboarding]()
    
    init() {
        getContents()
    }
    
    func getContents() {
        let newContents = [
            Onboarding(id: 0, title: "Store Your Ingredient", subtitle: "Know recommended storage to maximize ingredient shelf life", image: "house"),
            Onboarding(id: 1, title: "Don’t Forget Your Ingredients", subtitle: "Every ingredient you add unlocks more recipes", image: "house"),
            Onboarding(id: 2, title: "Be Reminded", subtitle: "Let us remind you to use your ingredients to reduce waste", image: "house")
        ]
        
        contents.append(contentsOf: newContents)
    }
    
}
