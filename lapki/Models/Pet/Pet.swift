//
//  Pet.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.11.2024.
//

import Foundation

enum PetNotificationType: String, CaseIterable {
    case isHungry
    case wantsToWalk
    case foodEnds
}

enum CatBreed: String, CaseIterable {
    case siamese
    case persian
    case bengal
}

enum DogBreed: String, CaseIterable {
    case goldenRetriever
    case labradorRetriever
    case goldenDoodle
}

protocol Pet: INotifier where NotificationType == PetNotificationType {
    associatedtype BreedType: RawRepresentable where BreedType.RawValue == String
    
    var id: String { get }
    var name: String { get set }
    var age: Int { get set }
    var breed: BreedType { get set }
}

struct Dog: Pet {
    typealias BreedType = DogBreed
    let id: String
    var name: String
    var age: Int
    var breed: DogBreed
}

struct Cat: Pet {
    typealias BreedType = CatBreed
    let id: String
    var name: String
    var age: Int
    var breed: CatBreed
}

extension Pet {
    func composeNotification(type: PetNotificationType) -> Notification {
        switch type {
            case .isHungry:
            return Notification(title: "New notification from \(name)", body: "\(name) is hungry, feed them!", createdAt: Date.now)
            case .wantsToWalk:
            return Notification(title: "New notification from \(name)", body: "\(name) wants to walk, let's go!", createdAt: Date.now)
        case .foodEnds:
            return Notification(title: "New notification from \(name)", body: "\(name)'s food is almots empty, consider buying some more!", createdAt: Date.now)
        
        }
    }
}

extension Cat {
    static var MOCK_CAT = Cat(id: "0", name: "Barsik", age: 10, breed: .bengal)
}

extension Dog {
    static var MOCK_DOG = Dog(id: "0", name: "Rex", age: 10, breed: .labradorRetriever)
}
