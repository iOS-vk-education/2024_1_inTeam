//
//  AppointmentModel.swift
//  lapki
//
//  Created by Савелий Коцур on 01.11.2024.
//

import Foundation

struct AppointmentModel: Identifiable {
    var id: UUID //Уникальный идентификатор
    //var place: PlaceModel //Место (заготовка)
    var date: Date //Дата и время записи
    
    init(id: UUID = UUID(), date: Date) {
        self.id = id
        self.date = date
    }
}
