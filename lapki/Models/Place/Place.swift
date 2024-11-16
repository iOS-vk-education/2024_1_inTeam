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
    var id: Int { get }
    var name: String { get }
    var type: PlaceType { get }
    var coordinatesJson: String? { get }
    var address: String { get }
    var photosId: [String] { get }
}
