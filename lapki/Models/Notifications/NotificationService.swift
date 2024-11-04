//
//  NotificationService.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.11.2024.
//

import Foundation
import UserNotifications

// Any notification service must conform to protocol
// in order to recieve notifications from
// notification center.
protocol NotificationService {
    //var type: supportedServices { get }
    
    // Notification center calls this method on
    // services that subscribed to it.
    // Need to define the algorithm how service will
    // handle the incoming notification.
    func recieve(_ notification: Notification)
}


