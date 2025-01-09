//
//  RecentNotifView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 09.01.2025.
//

import SwiftUI

struct RecentNotifView: View {
    let notification: Notification
    let onDismiss: () -> Void
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack(spacing: 14) {
                if let icon = notification.icon {
                    Text(icon)
                }
                Spacer()
                Text(notification.body)
                    .foregroundStyle(Color.Paws.Text.label)
                    .lineLimit(1)
                Spacer()
                Button {
                    onDismiss()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(Color.Paws.Text.label)
                        .frame(width: 16, height: 16)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.Paws.Background.elevatedContainerBG)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
    }
}
