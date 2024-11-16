//
//  WalkingAreaModel.swift
//  lapki
//
//  Created by Максим Лейхнер on 03.11.2024.
//

import Foundation
import CoreLocation
import UIKit

struct WalkingAreaModel: Place, Codable{
    
    var coordinatesJson: String?
    
    let id: Int
    
    let name: String
    
    let type: PlaceType
    
    let address: String
    
    let photosId: [String]
    
    
}
