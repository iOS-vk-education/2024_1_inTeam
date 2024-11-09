//
//  NotificationCenter.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.11.2024.
//

import Foundation
import UserNotifications

// This is the heart of notification system in this application.
// Holds all incoming notifications and pushing them to
// notification services that are user subscribed to.
struct NotificationCenter {
    static var shared: NotificationCenter = NotificationCenter()
    
    private(set) var notifications: [Notification] = []
    private(set) var services: [NotificationService] = []
    
    private var systemService: NotificationService?
    private var inAppService: NotificationService?
    
    mutating func newNotification(_ notification: Notification) {
        notifications.append(notification)
        print("New notification in Notification center: \(notification)")
        
        if let systemService {
            systemService.recieve(notification)
        }
        if let inAppService {
            inAppService.recieve(notification)
        }
    }
    
    mutating func addSystemService(_ service: NotificationService) {
        //print("Added to Notification center: \(service)")
        systemService = service
    }
    
    mutating func addInAppService(_ service: NotificationService) {
        //print("Added to Notification center: \(service)")
        inAppService = service
    }
    
    mutating func removeSystemService() {
        //print("Unsubsribed from system notifications")
        systemService = nil
    }
    
    mutating func removeInAppService() {
        //print("Unsubsribed from in-app notifications")
        inAppService = nil
    }
    
    func saveSubscriptions() {
        var subscribedServices: [String] = []
        if systemService != nil {
            subscribedServices.append("systemService")
        }
        if inAppService != nil {
            subscribedServices.append("inAppService")
        }
        UserDefaults.standard.set(subscribedServices, forKey: "subscribedServices")
    }
    
    mutating func loadSubscriptions() {
        let subscribedServices = UserDefaults.standard.array(forKey: "subscribedServices") as? [String] ?? []
        if subscribedServices.contains("systemService") {
            self.systemService = UNUserNotificationCenter.current() as NotificationService
        }
        if subscribedServices.contains("inAppService") {
            self.inAppService = InAppService.shared
        }
    }

}

