//
//  UserProfileView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.11.2024.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var systemNotifications: Bool = false
    @State private var internalNotifications: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    UserProfileHeaderView()
                        .padding(.top, 16)
                        .padding(.horizontal, 24)
                    
                    SectionView(header: "БЕЗОПАСНОСТЬ И ВХОД") {
                        NavigationLink {
                            // Navigate
                        } label: {
                            HStack {
                                Text("Изменить пароль")
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
                                Text("Двухфакторная авторизация")
                                    .foregroundStyle(Color.Paws.Text.label)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.Paws.Text.secondarySubhead)
                            }
                        }
                    }
                    .padding(.horizontal, 12)
                    
                    SectionView(header: "ДАННЫЕ") {
                        NavigationLink {
                            // Navigate
                        } label: {
                            HStack {
                                Text("Редактировать профиль")
                                    .foregroundStyle(Color.Paws.Text.label)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(Color.Paws.Text.secondarySubhead)
                            }
                        }
                        NavigationLink {
                            
                        } label: {
                            HStack {
                                Text("Удалить профиль")
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            .foregroundStyle(Color.red)
                        }
                    }
                    .padding(.horizontal, 12)
                }
            }
            .navigationTitle("Ваш аккаунт")
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
    UserProfileView()
}
