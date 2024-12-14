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
    
    private init() {
        Task {
            let _ = await checkSystemNotificationStatus()
        }
    }
    
    private(set) var notifications: [Notification] = []
    
    private(set) var systemService: NotificationService?
    private(set) var inAppService: NotificationService?
    
    func clearNotifications() {
        notifications.removeAll()
    }
    
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
    
    func checkSystemNotificationStatus() async -> Bool {
        let settings = await UNUserNotificationCenter.current().notificationSettings()
        let isAuthorized = settings.authorizationStatus == .authorized
        DispatchQueue.main.async {
            self.systemService = isAuthorized ? UNUserNotificationCenter.current() : nil
        }
        return isAuthorized
    }
    
    func addSystemService() async -> Bool {
        let service = await UNUserNotificationCenter.current().authorize()
        if let service {
            self.systemService = service
            return true
        } else {
            return false
        }
    }
    
    func addInAppService() {
        let service = InAppService.shared
        self.inAppService = service
    }
    
    func removeSystemService() {
        self.systemService = nil
    }
    
    func removeInAppService() {
        self.inAppService = nil
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

