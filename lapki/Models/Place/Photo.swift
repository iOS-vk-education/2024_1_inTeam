//
//  Photo.swift
//  lapki
//
//  Created by Максим Лейхнер on 09.11.2024.
//

typealias PhotoId = String

struct PhotoItem: Codable {
    let photo: PhotoId
    
    enum CodingKeys: String, CodingKey {
        case photo = "Photo"
    }
}
