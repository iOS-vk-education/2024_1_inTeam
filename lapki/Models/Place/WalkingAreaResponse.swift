//
//  WalkingAreaDto.swift
//  lapki
//
//  Created by Максим Лейхнер on 03.11.2024.
//

import Foundation

struct WalkingAreaResponse: Codable {
    let id: String
    let photosId: [String]
    let location: [String]
    let lighting: Bool
    let fencing: Bool
    
    
}
