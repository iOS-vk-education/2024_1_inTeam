//
//  UserPetListViewModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 15.12.2024.
//

import Foundation
import Swinject

class UserPetListViewModel: ObservableObject {
    // MARK: - Properties
    @Published var pets: [Pet] = []
    let petRepository = Container.petRepository
    
    // MARK: - Initializer
    init() {
        self.fetchPets()
    }
    
    func fetchPets() {
        pets = petRepository.fetchPets()
    }
    
    func addPet(_ pet: Pet) {
        petRepository.addPet(pet)
        self.fetchPets()
    }
}
