//
//  UpdateAppointmentView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 14.12.2024.
//

import SwiftUI

struct UpdateAppointmentView: View {
    let viewModel: AppointmentViewModel
    var appointment: AppointmentModel
    @State private var date: Date
    @Environment(\.dismiss) var dismiss
    
    init(appointment: AppointmentModel, viewModel: AppointmentViewModel) {
        self.appointment = appointment
        self.viewModel = viewModel
        _date = State(initialValue: appointment.date)
    }
    
    var body: some View {
        VStack {
            Text("Изменить дату записи")
                .font(.title3)
                .fontDesign(.rounded)
                .bold()
                .padding(.bottom, 16)
            
            DatePicker("Выберите дату", selection: $date, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.graphical)
                .padding()
                .tint(Color.Paws.Content.purple)
            Spacer()
            Button {
                viewModel.updateAppointment(appointment, newDate: date)
                dismiss()
            } label: {
                Text("Изменить дату")
                    .padding()
                    .background(Color.Paws.Content.purple)
                    .foregroundStyle(Color.Paws.Text.label)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
            }
        }
        .padding()
        .presentationDetents([.fraction(0.7)])
        .presentationCornerRadius(36)
        .presentationBackground(Color.Paws.Background.background)
    }
}
