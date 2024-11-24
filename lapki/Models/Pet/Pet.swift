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

enum CatBreed: String, CaseIterable {
    case siamese = "Сиамский"
    case persian = "Персидский"
    case bengal = "Бенгальский"
}

enum DogBreed: String, CaseIterable {
    case goldenRetriever = "Ретривер"
    case labradorRetriever = "Лабрадор"
    case goldenDoodle = "Дудлингер"
}

protocol Pet: Identifiable, INotifier where NotificationType == PetNotificationType {
    associatedtype BreedType: RawRepresentable where BreedType.RawValue == String
    
    var id: String { get }
    var name: String { get set }
    var age: Int { get set }
    var breed: BreedType { get set }
    var imageURL: String? { get set }
}

struct Dog: Pet {
    let id: String
    var name: String
    var age: Int
    var breed: DogBreed
    var imageURL: String?
}

struct Cat: Pet {
    let id: String
    var name: String
    var age: Int
    var breed: CatBreed
    var imageURL: String?
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
    static var MOCK_CAT = Cat(id: UUID.init().uuidString, name: "Барсик", age: 10, breed: .bengal)
}

extension Dog {
    static var MOCK_DOG = Dog(id: UUID.init().uuidString, name: "Рэкс", age: 10, breed: .labradorRetriever)
}
