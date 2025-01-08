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
class NotificationCenter {
    static var shared: NotificationCenter = NotificationCenter()
    
    private init() {}
    
    private(set) var notifications: [Notification] = []
    private(set) var services: [NotificationService] = []
    
    private var systemService: NotificationService?
    private var inAppService: NotificationService?
    
    func newNotification(_ notification: Notification) {
        notifications.append(notification)
        print("New notification in Notification center: \(notification)")
        
        if let systemService {
            systemService.recieve(notification)
        }
        if let inAppService {
            inAppService.recieve(notification)
        }
    }
    
    func addSystemService(_ service: NotificationService) {
        systemService = service
    }
    
    func addInAppService(_ service: NotificationService) {
        inAppService = service
    }
    
    func removeSystemService() {
        systemService = nil
    }
    
    func removeInAppService() {
        inAppService = nil
    }
    
    func saveSubscriptions() {
        var subscribedServices: [String] = []
        if systemService != nil {
            subscribedServices.append(supportedServices.system.rawValue)
        }
        if inAppService != nil {
            subscribedServices.append(supportedServices.inApp.rawValue)
        }
        UserDefaults.standard.set(subscribedServices, forKey: "subscribedServices")
    }
    
    func loadSubscriptions() {
        let subscribedServices = UserDefaults.standard.array(forKey: "subscribedServices") as? [String] ?? []
        if subscribedServices.contains(supportedServices.system.rawValue) {
            self.systemService = UNUserNotificationCenter.current() as NotificationService
        }
        if subscribedServices.contains(supportedServices.inApp.rawValue) {
            self.inAppService = InAppService.shared
        }
    }

}

