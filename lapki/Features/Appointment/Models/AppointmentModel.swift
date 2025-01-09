//
//  AppointmentModel.swift
//  lapki
//
//  Created by Савелий Коцур on 01.11.2024.
//

import Foundation

enum AppointmentNotificationType {
    case reminderHour(AppointmentModel)
    case reminderDay(AppointmentModel)
    // Can add more types
}

struct AppointmentModel: Identifiable, INotifier {
    typealias NotificationType = AppointmentNotificationType
    
    let id: String = UUID().uuidString //Уникальный идентификатор
    var place: Place //Место
    var pet: Pet //Питомец
    var date: Date //Дата и время записи
    
    init(place: Place, pet: Pet, date: Date) {
        self.place = place
        self.date = date
        self.pet = pet
    }

    func composeNotification(type: AppointmentNotificationType) -> Notification {
        switch type {
            case .reminderHour:
            return Notification(title: "Напоминание о записи", body: "Менее часа до записи в \(place.name)", icon: "📆", createdAt: Date.now)
        case .reminderDay:
            return Notification(title: "Напоминание о записи", body: "Менее суток до записи в \(place.name)", icon: "📆", createdAt: Date.now)

        }
    }
}

//extension AppointmentModel {
//    static var MOCK_APPOINTMENTS: [AppointmentModel] = [
//        AppointmentModel(place: WalkingAreaModel.MOCK_CLINICS[0], pet: Pet.MOCK_DOG, date: Date(timeIntervalSince1970: 167654)),
//        AppointmentModel(place: WalkingAreaModel.MOCK_CLINICS[0], pet: Pet.MOCK_CAT, date: Date(timeIntervalSince1970: 167654)),
//    ]
//}
