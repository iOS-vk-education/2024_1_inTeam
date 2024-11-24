//
//  SettingsView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var systemNotifications: Bool = false
    @State private var internalNotifications: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        Toggle(isOn: $systemNotifications) {
                            Text("Системные уведомления")
                                .foregroundStyle(Color.Paws.Text.label)
                        }
                        Toggle(isOn: $internalNotifications) {
                            Text("Внутренние уведомления")
                                .foregroundStyle(Color.Paws.Text.label)
                        }
                    } header: {
                        Text("Уведомления")
                            .foregroundStyle(Color.Paws.Text.secondarySubhead)
                    }
                    .listRowBackground(Color.Paws.Background.elevatedContainerBG)
                    .foregroundStyle(Color.Paws.Text.label)
                    
                    Section {
                        NavigationLink {
                            // Navigate
                        } label: {
                            HStack {
                                Text("О приложении")
                                Spacer()
                                Text("Версия 0.69")
                                    .foregroundStyle(Color.Paws.Text.secondarySubhead)
                            }
                        }
                        NavigationLink {
                            // Navigate
                        } label: {
                            Text("Справка")
                        }
                        NavigationLink {
                            // Navigate
                        } label: {
                            Text("Предложить фичу")
                        }
                    } header: {
                        Text("Помощь и обратная связь")
                            .foregroundStyle(Color.Paws.Text.secondarySubhead)
                    }
                    .listRowBackground(Color.Paws.Background.elevatedContainerBG)
                    .foregroundStyle(Color.Paws.Text.label)
                }
                .background(Color.Paws.Background.background)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Настройки")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                        Text("Назад")
                    }
                    .foregroundStyle(Color.Paws.Constant.uiAccent)
                }
            }
            .toolbarBackground(Material.thinMaterial, for: .navigationBar)
        }
        .presentationBackground(Color.Paws.Background.background)
    }
}

#Preview {
    SettingsView()
}
