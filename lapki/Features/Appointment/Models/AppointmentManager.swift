//
//  AppointmentManager.swift
//  lapki
//
//  Created by Maxim Makarenkov on 14.12.2024.
//

import Foundation

class AppointmentManager {
    static let shared = AppointmentManager()
    
    private init() {}
    
    private var appointments: [AppointmentModel] = [

    ]
    
    func fetchAppointments() -> [AppointmentModel] {
        return appointments.sorted(by: { $0.date < $1.date })
    }
    
    func addAppointment(_ appointment: AppointmentModel) {
        appointments.append(appointment)
    }
    
    func updateAppointment(_ appointment: AppointmentModel, newDate: Date) {
        if let index = appointments.firstIndex(where: { $0.id == appointment.id }) {
            appointments[index].date = newDate
        }
    }
    
    func deleteAppointment(_ appointment: AppointmentModel) {
        appointments.removeAll(where: { $0.id == appointment.id })
    }
}
