//
//  INotifier.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.11.2024.
//

import Foundation


// Protocol lets any entity to access using notification system
protocol INotifier {
    associatedtype NotificationType: RawRepresentable where NotificationType.RawValue == String
    // Need to implement function that describes the rules that notification is being composed.
    func composeNotification(type: NotificationType) -> Notification
}

extension INotifier {
    // Default implementation on pushing notification to Notification Center.
    // No need to override this method.
    func pushNotification(_ notification: Notification) -> Void {
        NotificationCenter.shared.newNotification(notification)
    }
}
