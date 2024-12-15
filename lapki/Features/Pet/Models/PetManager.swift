//
//  PetManager.swift
//  lapki
//
//  Created by Maxim Makarenkov on 15.12.2024.
//

class PetManager {
    static let shared = PetManager()
    
    private init() {}
    
    var pets: [Pet] = []
    
    func fetchPets() -> [Pet] {
        return pets
    }
    
    func addPet(_ pet: Pet) {
        pets.append(pet)
        print(pet)
    }
    
    func deletePet(_ pet: Pet) {
        pets.removeAll(where: { $0.id == pet.id })
    }
    
    func updatePet(_ pet: Pet) {
        if let index = pets.firstIndex(where: { $0.id == pet.id }) {
            pets[index] = pet
        }
    }
}
