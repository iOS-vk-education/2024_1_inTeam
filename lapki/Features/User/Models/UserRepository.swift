//
//  UserRepository.swift
//  lapki
//
//  Created by Maxim Makarenkov on 12.01.2025.
//

import Foundation

protocol UserRepository {
    func fetchUser(id: UUID) -> AuthedUser?
    
    func authUser(with credentials: UserCredentials) throws -> AuthedUser
    
    func registerUser(with credentials: UserCredentials, firstName: String, lastName: String) throws -> AuthedUser
    
    func updateUser(_ user: AuthedUser) throws
    
    func changePassword(_ user: AuthedUser, newPassword: String)
    
    //func deleteUser(_ user: User) throws
}
