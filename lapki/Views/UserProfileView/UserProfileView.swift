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
                            Text("Изменить пароль")
                        }
                        Toggle(isOn: $internalNotifications) {
                            Text("Внутренние уведомления")
                                .foregroundStyle(Color.Paws.Text.label)
                        }
                    }
                    
                    SectionView(header: "ДАННЫЕ") {
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
                            
                        } label: {
                            Text("Справка")
                        }
                        NavigationLink {
                            
                        } label: {
                            Text("Предложить фичу")
                        }
                    }
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

struct SectionView<Content: View>: View {
    var header: String
    var content: Content
    
    init(header: String, @ViewBuilder content: () -> Content) {
        self.header = header
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(header)
                .font(.subheadline)
                .foregroundStyle(Color.Paws.Text.secondarySubhead)
                .padding(.horizontal, 16)
                .padding(.top, 8)
            VStack(spacing: 0) {
                content
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 12)
            }
            .foregroundStyle(Color.Paws.Text.label)
            .background(Color.Paws.Background.elevatedContainerBG)
            .cornerRadius(12)
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
    }
}

#Preview {
    UserProfileView()
}
