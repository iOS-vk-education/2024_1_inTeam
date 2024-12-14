//
//  WalkingAreaModel.swift
//  lapki
//
//  Created by Максим Лейхнер on 03.11.2024.
//

import Foundation
import CoreLocation
import UIKit

struct WalkingAreaModel: Place, Codable {
    var isFavourite: Bool
    let coordinatesJson: String?
    let id: Int
    let name: String
    let type: PlaceType
    let address: String
    let photosId: [String]
    
}

extension WalkingAreaModel {
    static var MOCK_CLINIC = WalkingAreaModel(isFavourite: false, coordinatesJson: nil, id: 12564, name: "Красногвардейская ветеринарная лечебница", type: .clinic, address: "ул. Пушкина, дом Колотушкина, 7", photosId: ["TestClinic", "TestClinic"])
}
