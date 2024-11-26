//
//  NotificationViewModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 26.11.2024.
//

import Foundation

class NotificationViewModel: ObservableObject {
    @Published var notifications: [Notification] = []
    
    init() {
        self.notifications = NotificationCenter.shared.notifications
    }
    
    func clear() {
        NotificationCenter.shared.clearNotifications()
        self.notifications = NotificationCenter.shared.notifications
    }
}
