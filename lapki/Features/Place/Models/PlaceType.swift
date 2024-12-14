//
//  PlaceType.swift
//  lapki
//
//  Created by Максим Лейхнер on 03.11.2024.
//

import Foundation

public enum PlaceType: String, Codable {
    case clinic = "Клиника"
    case walkingArea = "Прогулочная площадка"
    case vaccination = "Пункт вакцинации"
    case shelter = "Приют"
}
