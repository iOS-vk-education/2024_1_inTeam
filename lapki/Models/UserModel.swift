//
//  UserModel.swift
//  lapki
//
//  Created by 596 on 17.11.2024.
//

import Foundation


struct User {
    let id: String
    var name: String
    var surname: String
    var photoPath: String
    var email: String
    var appointments: [AppointmentModel]
    var friends: [User]
    
    
}
//Commit ID:0b20b47da75b987e1be9dac8a29438f5ad2aab41
