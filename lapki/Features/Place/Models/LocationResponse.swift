//
//  LocationResponse.swift
//  lapki
//
//  Created by Максим Лейхнер on 09.11.2024.
//

struct LocationResponse: Codable {
    let coordinates: [Double]
    let type: String
}
