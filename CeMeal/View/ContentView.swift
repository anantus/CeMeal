//
//  ContentView.swift
//  CeMeal
//
//  Created by Maheswara Ananta Argono on 16/06/22.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @State var goToTabbedView: Bool = UserDefaults.standard.bool(forKey: "opened_once")
    
    var body: some View {
        if goToTabbedView {
            TabbedView()
            
            .onAppear {
                // MARK: Notification request
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
        } else {
            OnboardingView(goToTabbedView: $goToTabbedView)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
