//
//  AppointmentModel.swift
//  lapki
//
//  Created by Савелий Коцур on 01.11.2024.
//

import Foundation

struct AppointmentModel: Identifiable /*, INotifier*/ {
    let id: String = UUID().uuidString //Уникальный идентификатор
    //var place: PlaceModel //Место (заготовка)
    //var pet: PetModel //Питомец (заготовка)
    var date: Date //Дата и время записи
    
    init(date: Date) {
        self.date = date
    }

/*
    func composeNotification() -> Notification {
        return Notification(title: "Напоминание о записи", body: "У вас назначаена запись на \(date) в \(place)", createdAt: Date.now())
    }
*/
}
