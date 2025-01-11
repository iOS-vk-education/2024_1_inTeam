//
//  WalkingAreaModel.swift
//  lapki
//
//  Created by Максим Лейхнер on 03.11.2024.
//

import Foundation
import CoreLocation

struct WalkingAreaModel: Place, Codable {
    let id: Int
    var isFavourite: Bool
    let coordinates: CLLocationCoordinate2D?
    let name: String
    let type: PlaceType = .walkingArea
    let address: String
    let photosId: [String]
    var description: String
}

