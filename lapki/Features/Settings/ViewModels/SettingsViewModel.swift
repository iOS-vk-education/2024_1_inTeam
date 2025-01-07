//
//  SettingsViewModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 24.11.2024.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var systemNotifications: Bool = NotificationCenter.shared.systemService != nil {
        willSet {
            toggleSystemNotifications()
        }
    }
    
    @Published var internalNotifications: Bool = NotificationCenter.shared.inAppService != nil {
        willSet {
            toggleInternalNotifications()
        }
    }
    
    @Published var onFailure: Bool = false
    
    func toggleSystemNotifications() {
        if !systemNotifications {
            Task {
                let success = await NotificationCenter.shared.addSystemService()
                DispatchQueue.main.async { [self] in
                    if !success {
                        self.systemNotifications = false
                        onFailure = true
                    }
                }
            }
        } else {
            NotificationCenter.shared.removeSystemService()
        }
    }
    
    func toggleInternalNotifications() {
        if !internalNotifications {
            NotificationCenter.shared.addInAppService()
        } else {
            NotificationCenter.shared.removeInAppService()
        }
    }
    
    func checkSystemNotificationStatus() {
        NotificationCenter.shared.checkSystemNotificationStatus { [self] status in
            systemNotifications = status
        }
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("settings view model did become active")
        checkSystemNotificationStatus()
    }
}
