//
//  Place.swift
//  lapki
//
//  Created by Максим Лейхнер on 03.11.2024.
//

import Foundation
import UIKit
import CoreLocation

protocol Place {
    var id: Int { get set }
    var name: String { get set }
    var type: PlaceType { get set }
    var coordinatesJson: String? { get set }
    var address: String { get set }
    var photosId: [String] { get set }
    var isFavourite: Bool { get set }
}
