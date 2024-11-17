//
//  WalkingAreaResponse.swift
//  lapki
//
//  Created by Максим Лейхнер on 03.11.2024.
//

import Foundation

public struct WalkingAreaResponse: Codable {
    let id: Int
    let photosIds: [PhotoId]
    let location: LocationResponse
    let lighting: Bool
    let fencing: Bool
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case id = "global_id"
        case photosIds = "Photo"
        case location = "geoData"
        case lighting = "Lighting"
        case fencing = "Fencing"
        case address = "Location"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.location = try container.decode(LocationResponse.self, forKey: .location)
        self.photosIds = try container.decode([PhotoItem].self, forKey: .photosIds).map { $0.photo }
        self.address = try container.decode(String.self, forKey: .address)
        
        guard let fencing = try? container.decode(String.self, forKey: .fencing) else {
            throw DecodingError.dataCorruptedError(forKey: .fencing, in: container, debugDescription: "Неправильное значение для Bool")
        }
        
        switch fencing.lowercased() {
        case "да":
            self.fencing = true
        case "нет":
            self.fencing = false
        default: throw DecodingError.dataCorruptedError(forKey: .fencing, in: container, debugDescription: "Неправильное значение для Bool")
        }
        
        guard let lighting = try? container.decode(String.self, forKey: .lighting) else {
            throw DecodingError.dataCorruptedError(forKey: .fencing, in: container, debugDescription: "Неправильное значение для Bool")
        }
        
        self.lighting = switch lighting.lowercased() {
            case "да":
                true
            case "нет":
                false
            default: throw DecodingError.dataCorruptedError(forKey: .fencing, in: container, debugDescription: "Неправильное значение для Bool")
        }
    }
}