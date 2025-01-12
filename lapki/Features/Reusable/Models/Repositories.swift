//
//  Repositories.swift
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
    
    static var userRepository: UserRepository {
        shared.resolve(UserRepository.self)!
    }
    
    static var petRepository: PetRepository {
        shared.resolve(PetRepository.self)!
    }
    
    static var authedUser: AuthedUser {
        shared.resolve(AuthedUser.self)!
    }
}
