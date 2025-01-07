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
    
    func checkSystemNotificationStatus(completion: @escaping (Bool) -> Void) {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { (settings) in
            if(settings.authorizationStatus == .authorized) {
                self.systemService = center
                completion(true)
            } else {
                self.systemService = nil
                completion(false)
            }
        }
    }
    
    func addSystemService() async -> Bool {
        let service = await UNUserNotificationCenter.current().authorize()
        guard let service else {
            return false
        }
        DispatchQueue.main.async {
            self.systemService = service
        }
        return true
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
            checkSystemNotificationStatus { (isAuthorized) in
                if isAuthorized {
                    self.systemService = UNUserNotificationCenter.current()
                } else {
                    self.systemService = nil
                }
            }
        }
        if subscribedServices.contains(supportedServices.inApp.rawValue) {
            self.inAppService = InAppService.shared
        }
    }
}

