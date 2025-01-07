//
//  MapCameraBounds.swift
//  lapki
//
//  Created by Максим Лейхнер on 23.11.2024.
//

import Foundation

struct MapCameraBounds {
    let TopRightLatitude: Double
    let TopRightLongitude: Double
    let BottomLeftLatitude: Double
    let BottomLeftLongitude: Double
}

extension MapCameraBounds {
    func toBBoxString() -> String {
        return "\(TopRightLatitude),\(TopRightLongitude),\(BottomLeftLatitude),\(BottomLeftLongitude)"
    }
}
