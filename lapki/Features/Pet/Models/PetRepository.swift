//
//  PetRepository.swift
//  lapki
//
//  Created by Maxim Makarenkov on 12.01.2025.
//

protocol PetRepository {
    
    func fetchPets() -> [Pet]
    
    func addPet(_ pet: Pet)
    
    func deletePet(_ pet: Pet)
    
    func updatePet(_ pet: Pet)
}
