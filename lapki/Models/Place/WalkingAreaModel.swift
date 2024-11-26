//
//  WalkingAreaModel.swift
//  lapki
//
//  Created by Максим Лейхнер on 03.11.2024.
//

import Foundation
import CoreLocation
import UIKit

struct WalkingAreaModel: Place, Codable {
    
    var isFavourite: Bool
    
    var coordinatesJson: String?
    
    var id: Int
    
    var name: String
    
    var type: PlaceType
    
    var address: String
    
    var photosId: [String]
    
}
