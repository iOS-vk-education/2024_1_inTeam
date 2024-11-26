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
    //var place: PlaceModel //Место (заготовка)
    //var pet: PetModel //Питомец (заготовка)
    var date: Date //Дата и время записи
    
    init(date: Date) {
        self.date = date
    }

    func composeNotification(type: AppointmentNotificationType) -> Notification {
        switch type {
            case .reminder:
            return Notification(title: "Напоминание о записи", body: "У вас назначаена запись на \(date) в МЕСТО", createdAt: Date.now)
        }
    }
}
