//
//  Pet.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.11.2024.
//

import Foundation
import SwiftUI

enum PetNotificationType: String, CaseIterable {
    case isHungry
    case wantsToWalk
    case foodEnds
}

enum PetType {
    case cat(CatBreed)
    case dog(DogBreed)
    case other
}

enum CatBreed: String, CaseIterable {
    case siamese = "Сиамский"
    case persian = "Персидский"
    case bengal = "Бенгальский"
    case epic = "Эпический"
}

enum DogBreed: String, CaseIterable {
    case goldenRetriever = "Ретривер"
    case labradorRetriever = "Лабрадор"
    case goldenDoodle = "Дудлингер"
}

//protocol Pet: Identifiable, INotifier where NotificationType == PetNotificationType {
//    associatedtype BreedType: RawRepresentable where BreedType.RawValue == String
//    
//    var id: String { get }
//    var name: String { get set }
//    var age: Int { get set }
//    var breed: BreedType { get set }
//    var imageURL: String? { get set }
//}

protocol PetNotifier: Identifiable, INotifier where NotificationType == PetNotificationType {}

struct Pet: Identifiable, PetNotifier {
    let id: String
    var name: String
    var age: Int
    var imageURL: String?
    var type: PetType
    
    var breed: String? {
        switch type {
        case .cat(let breed):
            return breed.rawValue
        case .dog(let breed):
            return breed.rawValue
        case .other:
            return nil
        }
    }
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

extension Pet {
    static var MOCK_CAT = Pet(id: UUID().uuidString, name: "Бебрик", age: 4, type: .cat(.bengal))
    static var MOCK_DOG = Pet(id: UUID().uuidString, name: "Бобик", age: 6, type: .dog(.goldenDoodle))
}
