//
//  AppointmentManager.swift
//  lapki
//
//  Created by Maxim Makarenkov on 20.11.2024.
//

import Foundation

class AppointmentManager {
    static var shared = AppointmentManager()
    
    private init() {}
    
    var MOCK_APPOINTMENTS: [AppointmentModel] = [
        AppointmentModel(place: WalkingAreaModel.MOCK_WalkingAreaModel, pet: Pet.MOCK_DOG, date: Date(timeIntervalSince1970: 167654)),
        AppointmentModel(place: WalkingAreaModel.MOCK_WalkingAreaModel, pet: Pet.MOCK_CAT, date: Date(timeIntervalSince1970: 167654)),
    ]
}
