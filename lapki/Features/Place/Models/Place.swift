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
    var description: String { get }
}

extension Place {
    func toMapPlacemark() -> MapPlacemark? {
        // TODO: Нужно пропустить через геокодер если нет координат
        guard let coordinates else { return nil }
        return MapPlacemark(id: id, type: type, coordinates: coordinates)
    }
}


extension CLLocationCoordinate2D: Codable {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        self.init(latitude: latitude, longitude: longitude)
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
    
    private enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
}
