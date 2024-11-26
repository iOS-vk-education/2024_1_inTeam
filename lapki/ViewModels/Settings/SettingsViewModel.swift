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
        didSet {
            toggleSystemNotifications()
        }
    }
    @Published var internalNotifications: Bool = NotificationCenter.shared.inAppService != nil {
        didSet {
            toggleInternalNotifications()
        }
    }
    
    @Published var onFailure: Bool = false
    
    func toggleSystemNotifications() {
        if systemNotifications {
            Task {
                let success = await NotificationCenter.shared.addSystemService()
                if !success {
                    DispatchQueue.main.async {
                        self.systemNotifications = false
                        self.onFailure = true
                    }
                }
            }
        } else {
            NotificationCenter.shared.removeSystemService()
        }
    }
    
    func toggleInternalNotifications() {
        if internalNotifications {
            NotificationCenter.shared.addInAppService()
        } else {
            NotificationCenter.shared.removeInAppService()
        }
    }
    
    func checkSystemNotificationStatus() async {
        let status = await NotificationCenter.shared.checkSystemNotificationStatus()
        DispatchQueue.main.async {
            self.systemNotifications = status
        }
    }
    
}
