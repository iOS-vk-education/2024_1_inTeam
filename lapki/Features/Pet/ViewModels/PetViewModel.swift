//
//  PetViewModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 12.01.2025.
//

import Foundation

class PetViewModel: ObservableObject {
    @Published var pet: Pet

    init(pet: Pet) {
        self.pet = pet
    }
}
