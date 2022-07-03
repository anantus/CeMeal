//
//  OnboardingTabView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 03/07/22.
//

import SwiftUI

struct OnboardingTabView: View {
    
    var content: Onboarding
    
    var body: some View {
        VStack {
            // Onboarding tab image
            Image(content.image)
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.accentColor)
                .padding(.bottom, 36)
            
            // Onboarding tab title
            Text(content.title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.ui.title)
                .padding(.bottom, 8)
            
            // Onboarding tab subtitle
            Text(content.subtitle)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
        }
    }
}

struct OnboardingTabView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTabView(content: Onboarding(id: 0, title: "Store Your Ingredient", subtitle: "Know recommended storage to maximize ingredient shelf life", image: Image.ui.onboardingGarlic))
    }
}
