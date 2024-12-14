//
//  AppointmentDetailView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 14.12.2024.
//

import SwiftUI

struct AppointmentDetailView: View {
    let viewModel: AppointmentViewModel
    let appointment: AppointmentModel
    @State private var showUpdateAppointmentSheet: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 36) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Место записи")
                        .font(.headline)
                        .fontDesign(.rounded)
                        .bold()
                    if appointment.place.photosId.first != nil {
                        NavigationLink {
                            PlaceView(place: appointment.place)
                        } label: {
                            PlaceCardView(place: appointment.place, onActionButtonTap:  {
                                
                            })
                            .tint(Color.Paws.Text.label)
                        }
                    } else {
                        SectionView {
                            NavigationLink {
                                PlaceView(place: appointment.place)
                            } label: {
                                HStack {
                                        Text(appointment.place.name)
                                            .multilineTextAlignment(.leading)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .foregroundStyle(Color.Paws.Text.label)
                            }
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 8) {
                    VStack(alignment: .leading) {
                        Text("Дата приема: \(appointment.date.formatted(.dateTime))")
                        Text("Вы записали питомца")
                    }
                    .font(.headline)
                    .fontDesign(.rounded)
                    .bold()
                    SectionView {
                        NavigationLink {
                            // TODO: Navigate to PetView
                        } label: {
                            PetItem(pet: appointment.pet)
                        }
                    }
                }
                SectionView {
                    Button {
                        showUpdateAppointmentSheet.toggle()
                    } label: {
                        HStack {
                            Text("Изменить запись")
                                .foregroundStyle(Color.Paws.Text.label)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.Paws.Text.secondarySubhead)
                        }
                    }
                    Button {
                        viewModel.deleteAppointment(appointment)
                        dismiss()
                    } label: {
                        HStack {
                            Text("Удалить напоминание")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(Color.red)
                    }
                }
            }
            .padding(.top, 24)
            .padding(.horizontal)
        }
        .navigationTitle("Запись")
        .background(Color.Paws.Background.background)
        .sheet(isPresented: $showUpdateAppointmentSheet) {
            UpdateAppointmentView(appointment: appointment, viewModel: viewModel)
        }
    }
}
