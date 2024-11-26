//
//  SettingsView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                SectionView(header: "УВЕДОМЛЕНИЯ") {
                    Toggle(isOn: $viewModel.systemNotifications) {
                        Text("Системные уведомления")
                            .foregroundStyle(Color.Paws.Text.label)
                    }
                    .alert("Уведомления запрещены системой", isPresented: $viewModel.onFailure) {
                        Button("Открыть настройки", role: .cancel) {
                            openAppSettings()
                        }
                    } message: {
                        Text("Разрешите уведомления в настройках")
                    }
                    .onChange(of: viewModel.systemNotifications) { newValue in
                        viewModel.toggleSystemNotifications()
                    }
                    Toggle(isOn: $viewModel.internalNotifications) {
                        Text("Внутренние уведомления")
                            .foregroundStyle(Color.Paws.Text.label)
                    }
                }
                .padding(.horizontal, 16)
                
                SectionView(header: "ПОМОЩЬ И ОБРАТНАЯ СВЯЗЬ") {
                    NavigationLink {
                        // Navigate
                    } label: {
                        HStack {
                            Text("О приложении")
                                .foregroundStyle(Color.Paws.Text.label)
                            Spacer()
                            Text("Версия 0.69")
                                .foregroundStyle(Color.Paws.Text.secondarySubhead)
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.Paws.Text.secondarySubhead)
                        }
                    }
                    NavigationLink {
                        // Navigate
                    } label: {
                        HStack {
                            Text("Справка")
                                .foregroundStyle(Color.Paws.Text.label)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.Paws.Text.secondarySubhead)
                        }
                    }
                    NavigationLink {
                        // Navigate
                    } label: {
                        HStack {
                            Text("Предложить фичу")
                                .foregroundStyle(Color.Paws.Text.label)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.Paws.Text.secondarySubhead)
                        }
                    }
                }
                .padding(.horizontal, 16)
#if DEBUG
                SectionView(header: "DEBUG") {
                    NavigationLink {
                        NotifViewControllerRepresentable()
                    } label: {
                        Text("Тестирование уведомлений")
                    }
                }
                .padding(.horizontal, 16)
#endif
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
    
    private func openAppSettings() {
        if let appSettingsURL = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(appSettingsURL, options: [:], completionHandler: nil)
        }
    }
    
}

#Preview {
    SettingsView()
}
