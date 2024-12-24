//
//  AgeString.swift
//  lapki
//
//  Created by Maxim Makarenkov on 24.12.2024.
//

import Foundation

extension Int {
    func toAgedString() -> String {
        switch self % 10 {
        case 1:
            return "\(self) год"
        case 2...4:
            return "\(self) года"
        default:
            return "\(self) лет"
        }
}
