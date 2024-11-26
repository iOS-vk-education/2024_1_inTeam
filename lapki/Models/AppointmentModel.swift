//
//  AppointmentModel.swift
//  lapki
//
//  Created by Савелий Коцур on 01.11.2024.
//

import Foundation

enum AppointmentNotificationType: String, CaseIterable {
    case reminder
    // Can add more types
}

struct AppointmentModel: Identifiable, INotifier {
    typealias NotificationType = AppointmentNotificationType
    
    let id: String = UUID().uuidString //Уникальный идентификатор
    var place: any Place //Место
    var pet: any Pet //Питомец
    var date: Date //Дата и время записи
    
    init(place: Place, pet: any Pet, date: Date) {
        self.place = place
        self.date = date
        self.pet = pet
    }

    func composeNotification(type: AppointmentNotificationType) -> Notification {
        switch type {
            case .reminder:
            return Notification(title: "Напоминание о записи", body: "У вас назначена запись на \(date) в \(place.name)", createdAt: Date.now)
        }
    }
}
