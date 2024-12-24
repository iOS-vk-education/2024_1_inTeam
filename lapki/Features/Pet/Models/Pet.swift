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

enum PetBreed: Hashable {
    case catBreed(CatBreed)
    case dogBreed(DogBreed)
    case otherBreed(String)
}

enum PetType: Hashable {
    case cat
    case dog
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

protocol PetNotifier: Identifiable, INotifier where NotificationType == PetNotificationType {}

struct Pet: Identifiable, PetNotifier, Hashable {
    let id: String
    var name: String
    var age: Int
    var stringedAge: String {
        return age.toAgedString()
    }
    var imageURL: String?
    var type: PetType
    
    var enumBreed: PetBreed
    
    var breed: String {
        switch enumBreed {
        case .catBreed(let breed):
            return breed.rawValue
        case .dogBreed(let breed):
            return breed.rawValue
        case .otherBreed(let breed):
            return breed
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
    static var MOCK_CAT = Pet(id: UUID().uuidString, name: "Барсик", age: 3, type: .cat, enumBreed: .catBreed(.bengal))
    static var MOCK_DOG = Pet(id: UUID().uuidString, name: "Бобик" , age: 4, type: .dog, enumBreed: .dogBreed(.goldenDoodle))
    
    static var MOCK_PETS = [
        MOCK_CAT,
        MOCK_DOG
    ]
}
