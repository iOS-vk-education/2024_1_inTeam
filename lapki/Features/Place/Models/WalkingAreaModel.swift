//
//  WalkingAreaModel.swift
//  lapki
//
//  Created by Максим Лейхнер on 03.11.2024.
//

import Foundation
import CoreLocation
import UIKit

struct WalkingAreaModel: Place, Codable {
    let id: Int
    var isFavourite: Bool
    let coordinates: CLLocationCoordinate2D?
    let name: String
    let type: PlaceType
    let address: String
    let photosId: [String]
    
}

extension CLLocationCoordinate2D: Codable {
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        self.init(latitude: latitude, longitude: longitude)
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
    
    private enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
}

extension WalkingAreaModel {
    static var MOCK_CLINICS: [WalkingAreaModel] = [WalkingAreaModel(id: 12564, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7522, longitude: 37.6156), name: "Красногвардейская ветеринарная лечебница", type: .clinic, address: "ул. Пушкина, дом Колотушкина, 7", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 1, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6173), name: "Центральная ветеринарная клиника", type: .clinic, address: "Красная площадь, д. 1", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 2, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7655, longitude: 37.6843), name: "Клиника на Бауманской", type: .clinic, address: "ул. Бауманская, д. 12", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 3, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7446, longitude: 37.5666), name: "Западная ветеринарная клиника", type: .clinic, address: "ул. Кутузовский проспект, д. 45", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 4, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.8160, longitude: 37.4877), name: "Клиника на Сходненской", type: .clinic, address: "ул. Героев Панфиловцев, д. 22", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 5, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.6892, longitude: 37.7562), name: "Южная ветеринарная клиника", type: .clinic, address: "ул. Ташкентская, д. 17", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 6, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7994, longitude: 37.7993), name: "Клиника на Бабушкинской", type: .clinic, address: "ул. Менжинского, д. 15", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 7, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.6749, longitude: 37.5558), name: "Клиника в Южном Бутово", type: .clinic, address: "ул. Южнобутовская, д. 3", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 8, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.8670, longitude: 37.6057), name: "Клиника на Дмитровке", type: .clinic, address: "ул. Дмитровское шоссе, д. 89", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 9, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7468, longitude: 37.5745), name: "Клиника в районе Киевской", type: .clinic, address: "ул. Киевская, д. 2", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 10, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7411, longitude: 37.6566), name: "Клиника на Таганке", type: .clinic, address: "ул. Земляной Вал, д. 46", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 11, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.8503, longitude: 37.3724), name: "Клиника в Строгино", type: .clinic, address: "ул. Кулакова, д. 20", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 12, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.6827, longitude: 37.5072), name: "Клиника на Ленинском", type: .clinic, address: "Ленинский проспект, д. 90", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 13, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.8186, longitude: 37.7602), name: "Клиника на Щелковском", type: .clinic, address: "Щелковское шоссе, д. 100", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 14, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.6991, longitude: 37.7588), name: "Клиника в Кузьминках", type: .clinic, address: "ул. Юных Ленинцев, д. 10", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 15, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7520, longitude: 37.4954), name: "Клиника в районе Москва-Сити", type: .clinic, address: "ул. Пресненская набережная, д. 8", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 16, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.6255, longitude: 37.6265), name: "Клиника в Бирюлево", type: .clinic, address: "ул. Булатниковская, д. 14", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 17, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.9022, longitude: 37.5893), name: "Северная ветеринарная клиника", type: .clinic, address: "ул. Коровинское шоссе, д. 24", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 18, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7272, longitude: 37.5984), name: "Клиника на Октябрьской", type: .clinic, address: "ул. Калужская площадь, д. 1", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 19, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7964, longitude: 37.4953), name: "Клиника на Октябрьском Поле", type: .clinic, address: "ул. Народного Ополчения, д. 30", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 20, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.6697, longitude: 37.5526), name: "Клиника в Чертаново", type: .clinic, address: "ул. Варшавское шоссе, д. 152", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 21, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7402, longitude: 37.8374), name: "Клиника на Новогиреевской", type: .clinic, address: "ул. Новогиреевская, д. 5", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 22, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7989, longitude: 37.5828), name: "Клиника на Марьиной Роще", type: .clinic, address: "ул. Шереметьевская, д. 10", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 23, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.8500, longitude: 37.4055), name: "Клиника в Митино", type: .clinic, address: "ул. Митинская, д. 36", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 24, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.6550, longitude: 37.7404), name: "Клиника в районе Люблино", type: .clinic, address: "ул. Белореченская, д. 27", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 25, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.8852, longitude: 37.5155), name: "Клиника в Ховрино", type: .clinic, address: "ул. Фестивальная, д. 15", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 26, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7733, longitude: 37.6015), name: "Клиника на Цветном бульваре", type: .clinic, address: "Цветной бульвар, д. 10", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 27, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7028, longitude: 37.6450), name: "Клиника на Волгоградском", type: .clinic, address: "Волгоградский проспект, д. 35", photosId: ["TestClinic", "TestClinic"]),
                                                   WalkingAreaModel(id: 28, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7262, longitude: 37.8613), name: "Клиника в Новокосино", type: .clinic, address: "ул. Суздальская, д. 34", photosId: ["TestClinic", "TestClinic"]),
    ]
}
