//
//  TabbedView.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 03/07/22.
//

import SwiftUI

struct TabbedView: View {
    
    @EnvironmentObject private var locationManager: LocationManager
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            LeftoverView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Ingredient")
                }
                .tag(0)
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
                .tag(1)
        }
        .onAppear {
            requestNotification()
        }
    }
    
    func requestNotification() {
        locationManager.validateLocationAuthorizationStatus()
        locationManager.requestNotificationAuthorization()
    }
    
}

struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}
