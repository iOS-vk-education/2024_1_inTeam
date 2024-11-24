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
        AppointmentModel(date: Date(timeIntervalSince1970: 167654), pet: Dog.MOCK_DOG),
        AppointmentModel(date: Date(timeIntervalSince1970: 167654), pet: Cat.MOCK_CAT),
    ]
}
