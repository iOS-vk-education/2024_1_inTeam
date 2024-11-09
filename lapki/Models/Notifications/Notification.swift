//
//  Notification.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.11.2024.
//

import Foundation

// Notification structure that is used
// for Notification center.
// Any entity conforming INotifier must compose
// notifications relying on this template.
struct Notification {
    let title: String
    let body: String
    let createdAt: Date
}
