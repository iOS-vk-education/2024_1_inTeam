//
//  PlaceViewModel.swift
//  lapki
//
//  Created by Савелий Коцур on 15.12.2024.
//

import Foundation
import SwiftUI
import Swinject

final class PlaceViewModel: ObservableObject {
    @Published var place: Place
    let pets = Container.petRepository.fetchPets()
    @Published var date: Date
    @Published var pet: Pet?
    
    init(place: Place) {
        self.place = place
        self.date = Date()
        self.pet = pets.first
    }
    
    func addAppointment() {
        if let pet = pet {
            let appointment = AppointmentModel(place: place, pet: pet, date: date)
            AppointmentManager.shared.addAppointment(appointment)
        }
    }
    
    func availableMapsButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = []
        
        if let coordinates = place.coordinates {
            let destinationLatitude = coordinates.latitude
            let destinationLongitude = coordinates.longitude
            
            //Apple Maps
            let appleMapsURL = URL(string: "http://maps.apple.com/?daddr=\(destinationLatitude),\(destinationLongitude)")!
            buttons.append(.default(Text("Apple Maps")) {
                UIApplication.shared.open(appleMapsURL)
            })
            
            //Google Maps
            let googleMapsURL = URL(string: "comgooglemaps://?daddr=\(destinationLatitude),\(destinationLongitude)")!
            if UIApplication.shared.canOpenURL(googleMapsURL) {
                buttons.append(.default(Text("Google Maps")) {
                    UIApplication.shared.open(googleMapsURL)
                })
            }
            
            //Яндекс.Карты
            let yandexMapsURL = URL(string: "yandexmaps://build_route_on_map?lat_to=\(destinationLatitude)&lon_to=\(destinationLongitude)")!
            if UIApplication.shared.canOpenURL(yandexMapsURL) {
                buttons.append(.default(Text("Яндекс.Карты")) {
                    UIApplication.shared.open(yandexMapsURL)
                })
            }
            
            //2ГИС
            let twoGISURL = URL(string: "dgis://2gis.ru/routeSearch/to/\(destinationLongitude),\(destinationLatitude)")!
            if UIApplication.shared.canOpenURL(twoGISURL) {
                buttons.append(.default(Text("2ГИС")) {
                    UIApplication.shared.open(twoGISURL)
                })
            }
            
            buttons.append(.cancel(Text("Отмена")))
            
        }
        
        return buttons
    }
}

