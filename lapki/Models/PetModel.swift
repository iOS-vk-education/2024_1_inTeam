//
//  PetModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 01.11.2024.
//

import Foundation

enum CatBreed: String, CaseIterable {
    case bengal
    case siamese
    case persian
    //TODO: More breeds to add
}

enum DogBreed: String, CaseIterable {
    case goldenRetriever
    case bulldog
    case poodle
    //TODO: More breeds to add
}

struct Food {
    var name: String
    var initialAmount: Double
    var amount: Double
    var dailyPortion: Double
}


protocol Pet {
    associatedtype BreedType: RawRepresentable where BreedType.RawValue == String
    var id: String { get }
    var name: String { get set }
    var breed: BreedType { get set }
    var age: Int { get set }
    var photo: String { get set }
    
    func sendNotification() -> Void
}

struct Cat: Pet, Identifiable {
    typealias BreedType = CatBreed
    let id: String
    var name: String
    var breed: CatBreed
    var age: Int
    var photo: String
    var food: Food
}

struct Dog: Pet, Identifiable {
    typealias BreedType = DogBreed
    let id: String
    var name: String
    var breed: DogBreed
    var age: Int
    var photo: String
    var food: Food
}


extension Dog {
    static var MOCK_DOG = Dog(id: UUID().uuidString, name: "Бобик", breed: .bulldog, age: 10, photo: "Bobik.jpg", food: Food(name: "Pedigree", initialAmount: 30, amount: 25, dailyPortion: 0.8))
}

extension Cat {
    static var MOCK_CAT = Cat(id: UUID().uuidString, name: "Барсик", breed: .bengal, age: 3, photo: "Barsik.jpg", food: Food(name: "Purina One", initialAmount: 10, amount: 4, dailyPortion: 0.5))
}

extension Pet {
    func sendNotification() {
        // Питомец уведомляет, если осталось мало корма, либо в будущем придумаем еще какие-то уведы
        
        // Придумать Notification Center как модель, куда будут лететь все уведомления
    }
}
