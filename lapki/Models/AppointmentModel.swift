//
//  AppointmentModel.swift
//  lapki
//
//  Created by Савелий Коцур on 01.11.2024.
//

import Foundation

struct AppointmentModel: Identifiable {
    let id: UUID = UUID() //Уникальный идентификатор
    //var place: PlaceModel //Место (заготовка)
    //var pet: PetModel //Питомец (заготовка)
    var date: Date //Дата и время записи
    
    init(date: Date) {
        self.date = date
    }
}
