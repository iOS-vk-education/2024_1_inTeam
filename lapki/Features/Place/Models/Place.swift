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
    var coordinates: CLLocationCoordinate2D? { get }
    var address: String { get }
    var photosId: [String] { get }
    var isFavourite: Bool { get set } 
}

extension Place {
    func toMapPlacemark() -> MapPlacemark? {
        // TODO: Нужно пропустить через геокодер если нет координат
        guard let coordinates else { return nil }
        return MapPlacemark(id: id, type: type, coordinates: coordinates)
    }
}

