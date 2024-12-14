//
//  NotificationItemView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.11.2024.
//

import SwiftUI

struct NotificationItemView: View {
    var notification: Notification
    
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            Image(systemName: "cat.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
            VStack(alignment: .leading, spacing: 3) {
                Text(notification.title)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundStyle(Color.Paws.Text.label)
                Text("Барсик")
                    .font(.caption)
                    .foregroundStyle(Color.Paws.Text.secondaryLabel)
            }
            Spacer()
            Text("13:27")
                .foregroundStyle(Color.Paws.Text.secondaryLabel)
                .font(.caption2)
        }
        .padding(16)
        .background(Color.Paws.Background.elevatedContainerBG)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.1), radius: 10)
    }
}

#Preview {
    NotificationItemView(notification: Notification(title: "Тестовое уведомление", body: "Это тестовое уведомление", createdAt: Date.now))
}
