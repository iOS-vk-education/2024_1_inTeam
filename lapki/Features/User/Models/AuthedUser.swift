//
//  AuthedUser.swift
//  lapki
//
//  Created by 596 on 17.11.2024.
//

import Foundation

class AuthedUser {
    let id: UUID
    var firstName: String
    var lastName: String
    var email: String
    var photoName: String?
    
    init(id: UUID, firstName: String, lastName: String, email: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    init(from user: AuthedUser) {
        self.id = user.id
        self.email = user.email
        self.firstName = user.firstName
        self.lastName = user.lastName
    }
}
