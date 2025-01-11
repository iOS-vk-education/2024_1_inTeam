//
//  PlaceRepository.swift
//  lapki
//
//  Created by Maxim Leykhner on 09.01.2025.
//

protocol PlaceRepository {
    func save(place: Place)
    
    func update(place: Place)
    
    func delete(place: Place)
    
    func fetchAll() -> [Place]
    
    func fetchById(id: Int) -> Place?
    
    func filter<T: Specification>(by specification: T) -> [Place] where T.Item == Place
    
}

enum PlaceRepositoryError: Error {
    case placeNotFound
}
