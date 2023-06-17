//
//  PushNotificationsDemoApp.swift
//  PushNotificationsDemo
//
//  Created by RAMESH on 17/06/23.
//

import SwiftUI
import UserNotifications

@main
struct PushNotificationsDemoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK:- AppDelegate

class AppDelegate: NSObject,UIApplicationDelegate ,UNUserNotificationCenterDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        registerForPushNotifications()
        return true
    }
    
    // MARK:- Register Notifications
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert,.badge,.sound]) { (isGranted, error) in
                if let error = error {
                    print("Error:\(error.localizedDescription)")
                }else {
                    print("Granted permission:\(isGranted)")
                }
            }
    }
    
    // MARK:- Present Notification
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge,.sound])
    }
}
