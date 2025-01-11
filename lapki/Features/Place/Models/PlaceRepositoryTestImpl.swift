//
//  PlaceRepositoryTestImpl.swift
//  lapki
//
//  Created by Maxim Makarenkov on 09.01.2025.
//

import Foundation
import CoreLocation


class PlaceRepositoryTestImpl: PlaceRepository {
    var places: [Place] = [
        ClinicModel(id: 12564, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7522, longitude: 37.6156), name: "Красногвардейская ветеринарная лечебница", address: "ул. Пушкина, дом Колотушкина, 7", photosId: ["TestClinic", "TestClinic"], description: "Клиника с широким спектром ветеринарных услуг.", phoneNumber: "+7 495 123-45-67"),
        ClinicModel(id: 1, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6173), name: "Центральная ветеринарная клиника", address: "Красная площадь, д. 1", photosId: ["TestClinic", "TestClinic2"], description: "Современный центр диагностики и лечения животных.", phoneNumber: "+7 495 987-65-43"),
        ClinicModel(id: 2, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7655, longitude: 37.6843), name: "Клиника на Бауманской", address: "ул. Бауманская, д. 12", photosId: ["TestClinic", "TestClinic2"], description: "Опытные специалисты для ваших питомцев.", phoneNumber: "+7 495 654-32-10"),
        ClinicModel(id: 3, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7446, longitude: 37.5666), name: "Западная ветеринарная клиника", address: "ул. Кутузовский проспект, д. 45", photosId: ["TestClinic", "TestClinic2"], description: "Полный спектр ветеринарных услуг.", phoneNumber: "+7 495 789-01-23"),
        ClinicModel(id: 4, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.8160, longitude: 37.4877), name: "Клиника на Сходненской", address: "ул. Героев Панфиловцев, д. 22", photosId: ["TestClinic", "TestClinic2"], description: "Профессиональное лечение и забота о животных.", phoneNumber: "+7 495 111-22-33"),
        ClinicModel(id: 5, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.6892, longitude: 37.7562), name: "Южная ветеринарная клиника", address: "ул. Ташкентская, д. 17", photosId: ["TestClinic", "TestClinic2"], description: "Доступные цены и высокий уровень сервиса.", phoneNumber: "+7 495 444-55-66"),
        ClinicModel(id: 6, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7994, longitude: 37.7993), name: "Клиника на Бабушкинской", address: "ул. Менжинского, д. 15", photosId: ["TestClinic", "TestClinic2"], description: "Клиника для здоровья вашего питомца.", phoneNumber: "+7 495 777-88-99"),
        ClinicModel(id: 7, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.6789, longitude: 37.5964), name: "Клиника на Ленинском", address: "Ленинский проспект, д. 23", photosId: ["TestClinic", "TestClinic2"], description: "Круглосуточная помощь животным.", phoneNumber: "+7 495 555-77-88"),
        ClinicModel(id: 8, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7321, longitude: 37.5010), name: "Клиника у Воробьевых гор", address: "ул. Косыгина, д. 15", photosId: ["TestClinic", "TestClinic2"], description: "Специализированные услуги по экзотическим животным.", phoneNumber: "+7 495 333-44-55"),
        ClinicModel(id: 9, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7123, longitude: 37.6523), name: "Клиника на Таганке", address: "ул. Земляной Вал, д. 20", photosId: ["TestClinic", "TestClinic2"], description: "Доступное лечение и профилактика для всех видов питомцев.", phoneNumber: "+7 495 222-33-44"),
        ClinicModel(id: 10, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7488, longitude: 37.5804), name: "Клиника на Арбате", address: "Арбат, д. 45", photosId: ["TestClinic", "TestClinic2"], description: "Современное оборудование для диагностики и лечения.", phoneNumber: "+7 495 111-22-33"),
        ClinicModel(id: 11, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7560, longitude: 37.6252), name: "Клиника на Новом Арбате", address: "Новый Арбат, д. 21", photosId: ["TestClinic", "TestClinic2"], description: "Высококвалифицированные специалисты и круглосуточная помощь.", phoneNumber: "+7 495 666-77-88"),
        ClinicModel(id: 12, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7851, longitude: 37.5939), name: "Клиника на Соколе", address: "ул. Балтийская, д. 10", photosId: ["TestClinic", "TestClinic2"], description: "Комплексное обслуживание домашних питомцев.", phoneNumber: "+7 495 444-55-66"),
        WalkingAreaModel(id: 100, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7501, longitude: 37.8701), name: "Прогулочная площадка в Парке Горького", address: "ул. Крымский Вал, д. 9", photosId: ["WalkingArea1", "WalkingArea2"], description: "Просторная площадка для прогулок с питомцами."),
        WalkingAreaModel(id: 101, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7612, longitude: 37.6205), name: "Прогулочная площадка на Патриарших", address: "ул. Малая Бронная, д. 34", photosId: ["WalkingArea1", "WalkingArea2"], description: "Уютная прогулочная зона в центре города."),
        WalkingAreaModel(id: 102, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.8007, longitude: 37.5791), name: "Прогулочная площадка в Сокольниках", address: "ул. Сокольнический Вал, д. 1", photosId: ["WalkingArea1", "WalkingArea2"], description: "Прекрасное место для отдыха с домашними животными."),
        WalkingAreaModel(id: 103, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7020, longitude: 37.5301), name: "Прогулочная площадка в Нескучном саду", address: "ул. Андреевская набережная, д. 2", photosId: ["WalkingArea1", "WalkingArea2"], description: "Идеальное место для активного отдыха с собакой."),
        WalkingAreaModel(id: 104, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.8253, longitude: 37.3957), name: "Прогулочная площадка в Кусково", address: "ул. Юности, д. 1", photosId: ["WalkingArea1", "WalkingArea2"], description: "Просторная территория с зеленой зоной для питомцев."),
        WalkingAreaModel(id: 105, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.8710, longitude: 37.6774), name: "Прогулочная площадка в Лианозовском парке", address: "ул. Угличская, д. 13", photosId: ["WalkingArea1", "WalkingArea2"], description: "Уютный парк для прогулок и игр с животными."),
        WalkingAreaModel(id: 106, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7625, longitude: 37.5817), name: "Прогулочная площадка в Екатерининском парке", address: "ул. Екатерининская, д. 10", photosId: ["WalkingArea1", "WalkingArea2"], description: "Спокойная зона для прогулок с питомцами в центре города."),
        WalkingAreaModel(id: 107, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.8106, longitude: 37.7331), name: "Прогулочная площадка в Измайловском парке", address: "Измайловский проспект, д. 99", photosId: ["WalkingArea1", "WalkingArea2"], description: "Просторный парк с местами для активных игр."),
        WalkingAreaModel(id: 108, isFavourite: false, coordinates: CLLocationCoordinate2D(latitude: 55.7446, longitude: 37.6520), name: "Прогулочная площадка в Таганском парке", address: "ул. Таганская, д. 35", photosId: ["WalkingArea1", "WalkingArea2"], description: "Зона отдыха для владельцев собак с удобными дорожками."),
    ]
    
    func save(place: Place) {
        places.append(place)
    }
    
    func update(place: Place) {
        guard let placeIndex = places.firstIndex(where: { $0.id == place.id }) else {
            return
        }
        places[placeIndex] = place
    }
    
    func delete(place: Place) {
        places.removeAll(where: {$0.id == place.id})
    }
    
    func fetchAll() -> [Place] {
        return places
    }
    
    func fetchById(id: Int) -> (Place)? {
        let place = places.first(where: { $0.id == id })
        return place
    }
    
    func filter<T: Specification>(by specification: T) -> [Place] where T.Item == Place {
        return places.filter { specification.isSatisfied(by: $0) }
    }
}
