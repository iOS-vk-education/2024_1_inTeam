//
//  NotificationsView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.11.2024.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack() {
            NavigationStack {
                HStack(alignment: .center) {
                    Text("Уведомления")
                        .fontDesign(.rounded)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Очистить")
                            .foregroundStyle(.foreground)
                    }
                }
                .padding(.horizontal, 24)
                ForEach(1..<5) { _ in
                    NotificationButton()
                }
                .padding(.horizontal, 24)
                Spacer()
            }
            .padding(.top, 20)
        }
        .presentationDetents([.medium, .height(700)], selection: .constant(.medium))
        .presentationCornerRadius(48)
        .presentationDragIndicator(.hidden)
        .presentationBackground(.regularMaterial)
    }
}

#Preview {
    NotificationsView()
}
