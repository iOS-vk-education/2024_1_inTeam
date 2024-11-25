//
//  KeyManager.swift
//  lapki
//
//  Created by Максим Лейхнер on 23.11.2024.
//

import Foundation

class KeyManager {
    
    static func getKey(_ name: String) -> String? {
        let filePath = Bundle.main.url(forResource: "Keys", withExtension: "plist")
        guard let filePath else {
            print("No Keys.plist file provided!")
            return nil
        }
        let plist = NSDictionary(contentsOfFile: filePath.path())
        guard let plist else {
            print("Keys.plist file is corrupted!")
            return nil
        }
        let value = plist.object(forKey: name) as? String
        if value == nil {
            print("Key \(name) not found in Keys.plist file!")
        }
        return value
    }
}
