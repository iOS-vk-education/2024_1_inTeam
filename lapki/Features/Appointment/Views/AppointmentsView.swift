//
//  AppointmentsView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.11.2024.
//

import SwiftUI

struct AppointmentsView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: AppointmentViewModel = AppointmentViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.appointments.isEmpty {
                    VStack(spacing: 36) {
                        Text("У вас нет записей")
                            .font(.headline)
                        Image("SimpleCat")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                    .foregroundStyle(Color.Paws.Text.secondaryLabel)
                } else {
                    ScrollView {
                        VStack(spacing: 36) {
                            VStack(spacing: 18) {
                                ForEach(viewModel.appointments.prefix(3)) { appointment in
                                    NavigationLink(destination: AppointmentDetailView(appointment: appointment)) {
                                        AppointmentRowView(appointment: appointment)
                                            .tint(Color.Paws.Text.label)
                                    }
                                }
                                if viewModel.showMore {
                                    ForEach(viewModel.appointments.dropFirst(3)) { appointment in
                                        AppointmentRowView(appointment: appointment)
                                            .tint(Color.Paws.Text.label)
                                    }
                                }
                                if viewModel.appointments.count > 3 {
                                    Button {
                                        withAnimation() {
                                            viewModel.showMore.toggle()
                                        }
                                    } label: {
                                        HStack {
                                            if viewModel.showMore {
                                                Text("Скрыть")
                                                Image(systemName: "chevron.up")
                                            } else {
                                                Text("Еще \(viewModel.appointments.dropFirst(3).count)")
                                                Image(systemName: "chevron.down")
                                            }
                                        }
                                    }
                                    .foregroundStyle(Color.Paws.Constant.uiAccent)
                                }
                            }
                            if viewModel.pastAppointments.count > 0 {
                                VStack(spacing: 18) {
                                    HStack {
                                        Text("Прошедшие записи")
                                        Spacer()
                                    }
                                    .foregroundStyle(Color.Paws.Text.secondaryLabel)
                                    ForEach(viewModel.pastAppointments) { appointment in
                                        AppointmentRowView(appointment: appointment)
                                    }
                                }
                            }
                        }
                        .padding(.top, 24)
                        .padding(.horizontal)
                    }
                }
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
        .onAppear {
            viewModel.loadAppointments()
        }
        .tint(Color.Paws.Constant.uiAccent)
    }
}
