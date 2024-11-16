//
//  UserSheet.swift
//  lapki
//
//  Created by Maxim Makarenkov on 05.11.2024.
//

import SwiftUI

struct UserView: View {
    @Binding var showSheet: Bool
    @State private var showNotifications: Bool = false
    @Binding var appointments: Bool
    @Binding var settings: Bool
    @State private var detent: PresentationDetent = .medium
    @State private var lastDetent: PresentationDetent = .medium
    
    @Namespace var transitionElements
    
    var body: some View {
        HStack() {
            HStack {
                Image(systemName: "person.circle")
                VStack(alignment: .leading) {
                    Text("Максим Лейхнер")
                        .font(.headline)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                    Text("Ваш аккаунт")
                        .font(.footnote)
                        .fontDesign(.rounded)
                }
            }
            Spacer()
            Button {
                showSheet = false
            } label: {
                Image(systemName: "xmark")
                    .font(.subheadline)
                    .foregroundStyle(.foreground)
                    .padding(6)
                    .background(Color(.systemGray4))
                    .clipShape(Circle())
            }
        }
        .padding(.top, 24)
        .padding(.bottom, 16)
        .padding(.horizontal, 24)
        
        ScrollView {
            HStack(spacing: 5) {
                Button {
                    showSheet = false
                    appointments = true
                } label: {
                    VStack(alignment: .leading) {
                        Image(systemName: "pencil.and.list.clipboard")
                            .font(.title2)
                        Text("Мои записи")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    }
                    .foregroundStyle(.foreground)
                    .fontWeight(.medium)
                    .padding()
                    .background(Material.thinMaterial.opacity(0.6))
                    .background(Color("ButtonBackground"))
                    .cornerRadius(24)
                }
                Spacer()
                VStack(spacing: 20) {
                    Button {
                        showSheet = false
                        settings = true
                    } label: {
                        HStack {
                            Image(systemName: "gear")
                                .font(.title2)
                            Text("Настройки")
                                .font(.subheadline)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        }
                        .foregroundStyle(.foreground)
                        .fontWeight(.medium)
                        .padding()
                        .background(Material.thinMaterial.opacity(0.6))
                        .background(Color("ButtonBackground"))
                        .cornerRadius(24)
                    }
                    Button {
                        showNotifications.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "bell")
                                .font(.title2)
                            Text("Уведомления")
                                .font(.subheadline)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        }
                        .foregroundStyle(.foreground)
                        .fontWeight(.medium)
                        .padding()
                        .background(Material.thinMaterial.opacity(0.6))
                        .background(Color("ButtonBackground"))
                        .cornerRadius(24)
                    }
                }
            }
            .padding(.horizontal, 24)
            .shadow(color: .black.opacity(0.1), radius: 7)
            //.frame(maxWidth: .infinity, maxHeight: 130)
            .padding(.top, 20)
            
            HStack(alignment: .center) {
                Text("Питомцы")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                Spacer()
                Button {
                    
                } label: {
                    Text("Добавить")
                    Image(systemName: "plus")
                }
                .foregroundStyle(.foreground)
            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
            ForEach(0..<25) { _ in
                PetItem()
                    .padding(.vertical, 10)
                    .foregroundStyle(.foreground)
            }
            .padding(.horizontal, 24)
            Spacer()
            
        }
        
        //.padding(.top, 60)
        .scrollIndicators(.hidden)
        .presentationDetents([.medium, .height(700)],
                             selection: $detent)
        .presentationCornerRadius(48)
        .presentationBackground(.regularMaterial)
        .presentationDragIndicator(.hidden)
        .sheet(isPresented: $showNotifications) {
            NotificationsView()
                .onAppear {
                    lastDetent = detent
                }
                .onDisappear {
                    detent = lastDetent
                }
        }
    }
}

#Preview {
    UserView(showSheet: Binding<Bool>(get: { true }, set: { _ in }), appointments: Binding<Bool>(get: { false }, set: { _ in }), settings: Binding<Bool>(get: { false }, set: { _ in }))
}
