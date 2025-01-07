//
//  UserPetListViewModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 15.12.2024.
//

import Foundation

class UserPetListViewModel: ObservableObject {
    // MARK: - Properties
    @Published var pets: [Pet] = []
    
    private let petManager: PetManager
    
    // MARK: - Initializer
    init(manager: PetManager = .shared) {
        self.petManager = manager
        self.fetchPets()
    }
    
    func fetchPets() {
        pets = petManager.fetchPets()
    }
    
    func addPet(_ pet: Pet) {
        petManager.addPet(pet)
        self.fetchPets()
    }
}
