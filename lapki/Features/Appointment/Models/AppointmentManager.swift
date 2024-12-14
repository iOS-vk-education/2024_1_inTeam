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
        AppointmentModel(place: WalkingAreaModel.MOCK_CLINIC, pet: Pet.MOCK_CAT, date: Date.now + 300),
        AppointmentModel(place: WalkingAreaModel.MOCK_CLINIC, pet: Pet.MOCK_CAT, date: Date.now + 100),
        AppointmentModel(place: WalkingAreaModel.MOCK_CLINIC, pet: Pet.MOCK_CAT, date: Date.now - 1000)
    ]
    
    func fetchAppointments() -> [AppointmentModel] {
        return appointments.sorted(by: { $0.date < $1.date })
    }
    
    func addAppointment(_ appointment: AppointmentModel) {
        appointments.append(appointment)
    }
    
    func updateAppointment(_ appointment: AppointmentModel) {
        appointments.removeAll(where: { $0.id == appointment.id })
        appointments.append(appointment)
    }
    
    func deleteAppointment(_ appointment: AppointmentModel) {
        appointments.removeAll(where: { $0.id == appointment.id })
    }
}
