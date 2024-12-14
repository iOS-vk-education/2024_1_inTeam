//
//  AppointmentsView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.11.2024.
//

import SwiftUI

struct AppointmentsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showMore: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 36) {
                    VStack(spacing: 18) {
                        ForEach(AppointmentModel.MOCK_APPOINTMENTS) { appointment in
                            AppointmentRowView(appointment: appointment)
                            AppointmentRowView(appointment: appointment)
                        }
                        if showMore {
                            ForEach(AppointmentModel.MOCK_APPOINTMENTS) { appointment in
                                AppointmentRowView(appointment: appointment)
                                AppointmentRowView(appointment: appointment)
                            }
                        }
                        Button {
                            withAnimation() {
                                showMore.toggle()
                            }
                        } label: {
                            HStack {
                                if showMore {
                                    Text("Скрыть")
                                    Image(systemName: "chevron.up")
                                } else {
                                    Text("Еще 7")
                                    Image(systemName: "chevron.down")
                                }
                            }
                        }
                        .foregroundStyle(Color.Paws.Constant.uiAccent)
                    }
                    
                    VStack(spacing: 18) {
                        HStack {
                            Text("Прошедшие записи")
                            Spacer()
                        }
                        .foregroundStyle(Color.Paws.Text.secondaryLabel)
                        ForEach(AppointmentModel.MOCK_APPOINTMENTS) { appointment in
                            AppointmentRowView(appointment: appointment)
                            
                        }
                    }
                }
                .padding(.top, 24)
                .padding(.horizontal)
            }
            .navigationTitle("Мои записи")
            .navigationBarTitleDisplayMode(.large)
            .presentationBackground(Color.Paws.Background.background)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Назад")
                        }
                    }
                    .foregroundStyle(Color.Paws.Constant.uiAccent)
                }
            }
            .toolbarBackground(Material.thinMaterial, for: .navigationBar)
        }
    }
}
