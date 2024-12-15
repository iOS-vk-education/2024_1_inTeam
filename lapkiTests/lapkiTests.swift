//
//  lapkiTests.swift
//  lapkiTests
//
//  Created by Максим Лейхнер on 09.11.2024.
//

import Testing
import Foundation
@testable import lapki

struct lapkiTests {
    
    @Test func walkingAreaResponseDecode() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        
        let testBundle = Bundle(for: Helper.self)
        
        guard let fileUrl = testBundle.url(forResource: "walkingAreaResponse", withExtension: "json") else {
            fatalError("Не удалось найти тестовый файл")
        }
        
        do {
            let jsonData = try Data(contentsOf: fileUrl)
            
            let response = try JSONDecoder().decode(WalkingAreaResponse.self, from: jsonData)
            #expect(response.id == 272622268)
            #expect(response.photosIds == ["bf354616-ba1c-49cb-b8f3-fd8bb753a0f1", "32819155-e7d4-4507-9c3a-3d5c3f0ac192"])
            #expect(response.fencing == true)
            #expect(response.lighting == false)
            #expect(response.location.coordinates == [37.428639704, 55.747567311])
            #expect(response.address == "Российская Федерация, город Москва, внутригородская территория муниципальный округ Кунцево, Рублёвское шоссе, дом 26, корпус 4")
        } catch {
            print("Ошибка декодирования JSON: \(error)")
        }
        
    }
}

private class Helper {}
