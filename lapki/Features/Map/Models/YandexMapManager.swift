//
//  YandexMapManager.swift
//  lapki
//
//  Created by Максим Лейхнер on 23.11.2024.
//

import UIKit
import YandexMapsMobile
import CoreLocation
import Swinject

class YandexMapManager: NSObject, ObservableObject {
    
    @Published var userLocation: CLLocation? = nil
    @Published var cameraBounds: MapCameraBounds? = nil
    @Published var cameraMoving: Bool = false
    @Published var presentedPlaceInfo: Place? = nil
    @Published var showPlaceInfo: Bool = false
    private let placeRepository = Container.placeRepository
    
    private var delegate: YandexMapManagerDelegate? = nil
    
    let mapView: YMKMapView = YMKMapView(frame: .zero)
    private lazy var map: YMKMap = {
        return mapView.mapWindow.map
    }()
    
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        map.isNightModeEnabled = mapView.traitCollection.userInterfaceStyle == .dark
        map.addCameraListener(with: self)
        map.move(with: YMKCameraPosition(
            target: YMKPoint(latitude: 55.7522, longitude: 37.6156),
            zoom: 10,
            azimuth: 0,
            tilt: 0))
        if #available(iOS 17.0, *) {
            Task { @MainActor in
                print("Trait Changes registered")
                mapView.registerForTraitChanges([UITraitUserInterfaceStyle.self]) { [weak self] (view: YMKMapView, _: UITraitCollection) in
                    self?.map.isNightModeEnabled = view.traitCollection.userInterfaceStyle == .dark
                }
            }
        } else {
            // TODO: Пока не знаю как сделать
        }
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        // TODO: Говнокод
        for item in placeRepository.fetchAll() {
            addPlacemark(item.toMapPlacemark()!)
        }
    }
    
    func moveMapToUserLocation(duration: Float = 0.3) {
        guard let userLocation else { return }
        let position = YMKCameraPosition(
            target: YMKPoint(
                latitude: userLocation.coordinate.latitude,
                longitude: userLocation.coordinate.longitude
            ),
            zoom: 10,
            azimuth: 0,
            tilt: 0
        )
        moveMap(to: position, duration: duration)
    }
    
    func moveMap(to position: YMKCameraPosition, duration: Float = 0.3) {
        map.move(
            with: position,
            animation: YMKAnimation(type: .smooth, duration: duration)
        )
    }
    
    private func setCameraMovingState(_ newState: Bool) {
        if self.cameraMoving && !newState {
            delegate?.onCameraStoppedMoving(with: map)
        } else if !self.cameraMoving && newState {
            delegate?.onCameraStartedMoving(with: map)
        }
        
        self.cameraMoving = newState
    }
    
    func setDelegate(_ delegate: YandexMapManagerDelegate) {
        self.delegate = delegate
    }
    
    func addPlacemark(_ mark: MapPlacemark) {
        let iconStyle = YMKIconStyle()
        iconStyle.anchor = NSValue(cgPoint: CGPoint(x: 0.5, y: 0.6))
        iconStyle.scale = 0.3
        
        let placemark = map.mapObjects.addPlacemark()
        placemark.geometry = YMKPoint(latitude: mark.coordinates.latitude, longitude: mark.coordinates.longitude)
        placemark.addTapListener(with: self)
        placemark.userData = mark
        
        var imageName: String = ""
        
        // TODO: добавить картинки для других мест
        switch mark.type {
        case .clinic:
            imageName = "pin_clinic"
        case .walkingArea:
            imageName = "pin_walk"
        case .vaccination:
            imageName = "pin_clinic"
        case .shelter:
            imageName = "pin_clinic"
        }
        
        placemark.setIconWith(UIImage(named: imageName)!, style: iconStyle) // TODO: Обработать анврап
    }
}

extension YandexMapManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            self.manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.userLocation = locations.last
    }
}

extension YandexMapManager: YMKMapCameraListener {
    
    func onCameraPositionChanged(with map: YMKMap, cameraPosition: YMKCameraPosition, cameraUpdateReason: YMKCameraUpdateReason, finished: Bool) {
        self.cameraBounds = map.visibleRegion.toMapCameraBounds()
        setCameraMovingState(!finished)
    }
}

extension YMKVisibleRegion {
    
    func toMapCameraBounds() -> MapCameraBounds {
        return MapCameraBounds(
            TopRightLatitude: self.topRight.latitude,
            TopRightLongitude: self.topRight.longitude,
            BottomLeftLatitude: self.bottomLeft.latitude,
            BottomLeftLongitude: self.bottomLeft.longitude
        )
    }
}

extension YandexMapManager: YMKMapObjectTapListener {
    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
        if let mapObject = mapObject as? YMKPlacemarkMapObject, let placemark = mapObject.userData as? MapPlacemark {
            showPlaceInfo = false
            presentedPlaceInfo = placeRepository.fetchById(id: placemark.id)
            showPlaceInfo = true
            print("Tapped placemark: \(String(describing: mapObject.userData as? MapPlacemark))")
            return true
        }
        return false
    }
}
