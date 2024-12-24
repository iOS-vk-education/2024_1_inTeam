//
//  PlaceViewModel.swift
//  lapki
//
//  Created by Савелий Коцур on 15.12.2024.
//

import Foundation
import SwiftUI

final class PlaceViewModel: ObservableObject {
    let place: Place
    let pets = PetManager.shared.fetchPets()
    @Published var date: Date
    @Published var pet: Pet?
    
    init(place: Place) {
        self.place = place
        self.date = Date()
        self.pet = pets.first
    }
    
    func addAppointment() {
        if let pet = pet {
            let appointment = AppointmentModel(place: place, pet: pet, date: date)
            AppointmentManager.shared.addAppointment(appointment)
        }
    }
}
