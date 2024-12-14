//
//  PetManager.swift
//  lapki
//
//  Created by Maxim Makarenkov on 20.11.2024.
//

import Foundation

class PetManager {
    static let shared = PetManager()
    
    private init() {}
    
    var MOCK_PETS: [Pet] {
        [Pet.MOCK_CAT, Pet.MOCK_DOG]
    }
}
