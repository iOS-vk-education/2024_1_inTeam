//
//  AppointmentViewModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 14.12.2024.
//

import Foundation

class AppointmentViewModel: ObservableObject {
    // MARK: - Properties
    @Published var appointments: [AppointmentModel] = []
    @Published var pastAppointments: [AppointmentModel] = []
    @Published var showMore: Bool = false
    @Published var showUpdate: Bool = false
    
    private let appointmentManager: AppointmentManager
    
    // MARK: - Initializer
    init(manager: AppointmentManager = .shared) {
        self.appointmentManager = manager
        loadAppointments()
    }
    
    // MARK: - Methods
    func loadAppointments() {
        let allAppointments = appointmentManager.fetchAppointments()
        
        let now = Date()
        appointments = allAppointments.filter { $0.date > now }
        pastAppointments = allAppointments.filter { $0.date <= now }
    }
    
    func addAppointment(_ appointment: AppointmentModel) {
        appointmentManager.addAppointment(appointment)
        loadAppointments()
    }
    
    func deleteAppointment(_ appointment: AppointmentModel) {
        appointmentManager.deleteAppointment(appointment)
        loadAppointments()
    }
    
    func updateAppointment(_ appointment: AppointmentModel) {
        appointmentManager.updateAppointment(appointment)
        loadAppointments()
    }
    
    func toggleShowMore() {
        showMore.toggle()
    }
}
