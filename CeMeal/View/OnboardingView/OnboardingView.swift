//
//  OnboardingView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 03/07/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var goToTabbedView: Bool
    @ObservedObject var onboardingViewModel = OnboardingViewModel()
    @State private var currentTab = 0
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack {
                // Skip button
                if currentTab != 2 {
                    Button {
                        currentTab = 2
                    } label: {
                        Text("Skip")
                            .foregroundColor(.accentColor)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)

                } else {
                    Text("")
                        .padding(.vertical, 3)
                }
                
                Spacer()
                
                TabView(selection: $currentTab) {
                    ForEach(onboardingViewModel.contents) { content in
                        OnboardingTabView(content: content)
                            .tag(content.id)
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(maxHeight: geometry.size.height * 0.6, alignment: .center)
                
                Spacer()
                
                // Get started button
                Button {
                    if currentTab != 2 {
                        currentTab += 1
                    } else {
                        goToTabbedView.toggle()
                        UserDefaults.standard.set(true, forKey: "opened_once")
                    }
                } label: {
                    Text(currentTab != 2 ? "Next" : "Get Started")
                        .fontWeight(.heavy)
                }
                .buttonStyle(.borderedProminent)
                .frame(minWidth: 150)
                .background(RoundedRectangle(cornerRadius: 5.0).fill(Color.accentColor))
                .padding(.bottom, 40)
            }
        })
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(goToTabbedView: .constant(false))
    }
}
