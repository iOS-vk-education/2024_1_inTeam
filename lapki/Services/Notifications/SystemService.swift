//
//  SystemService.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.11.2024.
//

import Foundation
import UserNotifications

// This file defines the behave of system notification service
// on handling the notifications.

func requestNotificationAuthorization() {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if let error = error {
            print("Authorization error: \(error)")
        } else {
            print("Authorization granted: \(granted)")
        }
    }
}

func sendLocalNotification(title: String, body: String) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = .default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Failed to add notification: \(error)")
        } else {
            print("Notification scheduled successfully")
        }
    }
}

extension UNUserNotificationCenter: NotificationService {
    func recieve(_ notification: Notification) {
        //print("System notification received: \(notification)")
        sendLocalNotification(title: notification.title, body: notification.body)
    }
    
    func authorize() async -> NotificationService? {
        do {
            let success = try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
            if success {
                return UNUserNotificationCenter.current() as NotificationService
            } else {
                print("Authorization denied")
                return nil
            }
        } catch {
            print("Failed to request authorization: \(error.localizedDescription)")
            return nil
        }
    }
    
}
