//
//  NotificationsView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.11.2024.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("Уведомления")
                .fontDesign(.rounded)
                .font(.largeTitle)
                .bold()
            Spacer()
            Button {
                // Clear
            } label: {
                Text("Очистить")
                    .foregroundStyle(.foreground)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
        NavigationView {
            ScrollView {
                VStack(spacing: 18) {
                    ForEach(1..<5) { _ in
                        NotificationItemView()
                    }
                }
                .padding(24)
                Spacer()
            }
        }
        .presentationDetents([.medium, .height(700)], selection: .constant(.medium))
        .presentationCornerRadius(48)
        .presentationDragIndicator(.hidden)
        .presentationBackground(Color.Paws.Background.background)
    }
}

#Preview {
    NotificationsView()
}
