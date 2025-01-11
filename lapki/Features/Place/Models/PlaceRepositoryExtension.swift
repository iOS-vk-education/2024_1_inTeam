//
//  PlaceRepositoryExtension.swift
//  lapki
//
//  Created by Maxim Makarenkov on 09.01.2025.
//

import Swinject

extension Container {
    static let shared = Container()
    
    static var placeRepository: PlaceRepository {
        shared.resolve(PlaceRepository.self)!
    }
}
