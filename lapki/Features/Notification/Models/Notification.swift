//
//  Notification.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.11.2024.
//

import Foundation
import SwiftUI

// Notification structure that is used
// for Notification center.
// Any entity conforming INotifier must compose
// notifications relying on this template.
struct Notification: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let body: String
    let icon: String?
    let createdAt: Date
    //let data: any INotifier
    //let data: NotificationType
}
