//
//  LocationManager.swift
//  CeMeal
//
//  Created by Darma Wiryanata on 20/07/22.
//

import CoreLocation
import UserNotifications

class LocationManager: NSObject, ObservableObject {
    let notificationCenter = UNUserNotificationCenter.current()
    let locations = [
        CLLocationCoordinate2D(latitude: 37.33182, longitude: -122.03118)
    ]
    
    lazy var storeRegions = makeStoreRegion()
    lazy var locationManager = makeLocationManager()
    
    override init() {
        super.init()

        notificationCenter.delegate = self
    }
    
    private func makeLocationManager() -> CLLocationManager {
        let manager = CLLocationManager()
        return manager
    }
    
    private func makeStoreRegion() -> [CLCircularRegion] {
        var regions = [CLCircularRegion]()
        for location in locations {
            let region = CLCircularRegion(
                center: location,
                radius: 2,
                identifier: UUID().uuidString)
            region.notifyOnEntry = true
            
            regions.append(region)
        }
        
        return regions
    }
    
    func validateLocationAuthorizationStatus() {
        switch locationManager.authorizationStatus {
        case .notDetermined, .denied, .restricted:
            print("Location Services Not Authorized")
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            print("Location Services Authorized")
        default:
            break
        }
    }
    
    func requestNotificationAuthorization() {
        let options: UNAuthorizationOptions = [.sound, .alert]
        notificationCenter
        .requestAuthorization(options: options) { [weak self] result, _ in
            print("Notification Auth Request result: \(result)")
            
            if result {
                self?.registerNotification()
            }
        }
    }
    
    private func registerNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Welcome to Swifty TakeOut"
        notificationContent.body = "Your order will be ready shortly."
        notificationContent.sound = .default

        for storeRegion in storeRegions {
            let trigger = UNLocationNotificationTrigger(
                region: storeRegion,
                repeats: false
            )

            let request = UNNotificationRequest(
                identifier: UUID().uuidString,
                content: notificationContent,
                trigger: trigger
            )

            notificationCenter
                .add(request) { error in
                    if error != nil {
                        print("Error: \(String(describing: error))")
                    }
                }
        }
    }

}

extension LocationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
      _ center: UNUserNotificationCenter,
      didReceive response: UNNotificationResponse,
      withCompletionHandler completionHandler: @escaping () -> Void
    ) {
      print("Received Notification")
      completionHandler()
    }

    func userNotificationCenter(
      _ center: UNUserNotificationCenter,
      willPresent notification: UNNotification,
      withCompletionHandler completionHandler:
        @escaping (UNNotificationPresentationOptions) -> Void
    ) {
      print("Received Notification in Foreground")
      completionHandler(.sound)
    }

}
