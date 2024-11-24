//
//  UserButtonGroupView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 17.11.2024.
//

import SwiftUI

struct UserButtonGroupView: View {
    @Binding var showAppointments: Bool
    @Binding var showSettings: Bool
    @Binding var showNotifications: Bool
    
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                    Button {
                        showAppointments.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.Paws.Background.elevatedContainerBG)
                            .overlay {
                                VStack(alignment: .leading) {
                                    Image(systemName: "pencil.and.list.clipboard")
                                        .font(.title2)
                                    Text("Мои записи")
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                }
                                .foregroundStyle(Color.Paws.Text.label)
                                .padding()
                            }
                            .frame(height: 136)
                            .shadow(color: .black.opacity(0.1), radius: 10)
                    }
                VStack(spacing: 20) {
                    Button {
                        withAnimation {
                            showSettings.toggle()
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.Paws.Background.elevatedContainerBG)
                            .overlay {
                                HStack {
                                    Image(systemName: "gear")
                                        .font(.title2)
                                    Text("Настройки")
                                        .font(.subheadline)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                }
                                .foregroundStyle(Color.Paws.Text.label)
                                .padding()
                            }
                            .shadow(color: .black.opacity(0.1), radius: 10)
                        
                    }
                    Button {
                        showNotifications.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.Paws.Background.elevatedContainerBG)
                            .overlay {
                                HStack {
                                    Image(systemName: "bell")
                                        .font(.title2)
                                    Text("Уведомления")
                                        .font(.subheadline)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                }
                                .foregroundStyle(Color.Paws.Text.label)
                                .padding()
                            }
                            .shadow(color: .black.opacity(0.1), radius: 10)
                    }
                }
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    UserButtonGroupView(showAppointments: Binding<Bool>(get: { false }, set: { _ in }), showSettings: Binding<Bool>(get: { false }, set: { _ in }), showNotifications: Binding<Bool>(get: { false }, set: { _ in }))
}
