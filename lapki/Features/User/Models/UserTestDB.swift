//
//  UserTestDB.swift
//  lapki
//
//  Created by Maxim Makarenkov on 12.01.2025.
//
import Foundation
import Swinject

class UserTestDB: UserRepository {
    
    private var credentials: [UserCredentials] = [
        UserCredentials(email: "mleykhner@gmail.com",
                        password: "leykhnerMax123"),
    ]
    
    var users: [AuthedUser] = [
        AuthedUser(id: UUID(),
             firstName: "Максим",
             lastName: "Лейхнер",
             email: "mleykhner@gmail.com"
            ),
    ]
    
    
    func fetchUser(id: UUID) -> AuthedUser? {
        let user = users.first { $0.id == id }
        return user
    }
    
    func authUser(with credentials: UserCredentials) throws -> AuthedUser {
        let email = self.credentials.first(where: { $0.email == credentials.email})
        if let email {
            guard email.password == credentials.password else {
                throw UserDBError.invalidCredentials
            }
            return users.first { $0.email == credentials.email }!
        }
        throw UserDBError.userNotFound
    }
    
    func registerUser(with credentials: UserCredentials, firstName: String, lastName: String) throws -> AuthedUser {
        self.credentials.append(credentials)
        let user = AuthedUser(id: UUID(), firstName: firstName, lastName: lastName, email: credentials.email)
        self.users.append(user)
        return user
    }
    
    func updateUser(_ user: AuthedUser) throws {
        guard let foundUserIndex = users.firstIndex(where: { $0.id == user.id }) else {
            throw UserDBError.userNotFound
        }
        users[foundUserIndex] = user
    }
    
    func changePassword(_ user: AuthedUser, newPassword: String) {
        let email = user.email
        guard let foundUserIndex = users.firstIndex(where: { $0.email == email }) else {
            return
        }
        credentials[foundUserIndex].password = newPassword
    }
    
//    func deleteUser(_ user: User) throws {
//
//    }
}

enum UserDBError: Error {
    case invalidCredentials
    case userNotFound
}
