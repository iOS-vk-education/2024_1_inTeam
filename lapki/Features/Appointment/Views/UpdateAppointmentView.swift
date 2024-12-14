//
//  UpdateAppointmentView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 14.12.2024.
//

import SwiftUI

struct UpdateAppointmentView: View {
    var appointment: AppointmentModel
    @State private var date: Date
    
    init(appointment: AppointmentModel) {
        self.appointment = appointment
        _date = State(initialValue: appointment.date)
    }
    
    var body: some View {
        VStack {
            Text("Изменить дату записи")
                .font(.headline)
                .fontDesign(.rounded)
                .bold()
                .padding(.bottom, 16)
            
            DatePicker("Выберите дату", selection: $date, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.graphical)
                .padding()
                .tint(Color.Paws.Content.purple)
            Spacer()
        }
        .padding()
        .presentationDetents([.fraction(0.7)])
        .presentationCornerRadius(36)
        .presentationBackground(Color.Paws.Background.background)
    }
}
