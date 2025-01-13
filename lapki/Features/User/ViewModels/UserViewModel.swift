//
//  UserViewModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 12.01.2025.
//

import Foundation
import Swinject

class UserViewModel: ObservableObject {
    let userRepository = Container.userRepository
    @Published var user: AuthedUser = Container.authedUser
    
    func saveChanges() -> Bool {
        do {
            try userRepository.updateUser(user)
            return true
        } catch {
            return false
        }
    }
}
