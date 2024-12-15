//
//  Photo.swift
//  lapki
//
//  Created by Максим Лейхнер on 09.11.2024.
//

struct PhotoItem: Codable {
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case photo = "Photo"
    }
}
