//
//  BusinessDayDto.swift
//  lapki
//
//  Created by Максим Лейхнер on 09.11.2024.
//
struct BusinessDayDto: Codable {
    let dayOfWeek: String
    let hours: String
    
    enum CodingKeys: String, CodingKey {
        case dayOfWeek = "DayOfWeek"
        case hours = "Hours"
    }
}
