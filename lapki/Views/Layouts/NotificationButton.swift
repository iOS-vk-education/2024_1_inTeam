//
//  NotificationButton.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.11.2024.
//

import SwiftUI

struct NotificationButton: View {
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            Image(systemName: "cat.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
            VStack(alignment: .leading, spacing: 3) {
                Text("Корм почти закончился")
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .font(.subheadline)
                    .lineLimit(1)
                Text("Барсик")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text("13:27")
                .foregroundStyle(.secondary)
                .font(.caption2)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color(.buttonBackground))
        .cornerRadius(24)
    }
}

#Preview {
    NotificationButton()
}
