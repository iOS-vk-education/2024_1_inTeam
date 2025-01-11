//
//  ClinicModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.01.2025.
//

import Foundation
import CoreLocation

struct ClinicModel: Place, Codable {
    let id: Int
    var isFavourite: Bool
    let coordinates: CLLocationCoordinate2D?
    let name: String
    let type: PlaceType = .clinic
    let address: String
    let photosId: [String]
    var description: String
    let phoneNumber: String
}
