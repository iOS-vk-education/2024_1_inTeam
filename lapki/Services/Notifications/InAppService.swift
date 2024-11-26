//
//  InAppService.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.11.2024.
//

import Foundation

// Internal in-app notification service, which can show up to one notification.
// Assumed to be used on main screen to show latest pop-up notification.
class InAppService: NotificationService {
    static var shared: InAppService = InAppService()
    
    var activeNotification: Notification?
    
    func recieve(_ notification: Notification) {
        activeNotification = notification
        print("In-app notification received: \(notification)")
    }
    
    // Link to dismiss button in View implemented later
    func clear() {
        activeNotification = nil
    }
}
