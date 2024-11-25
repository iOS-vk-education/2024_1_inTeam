//
//  YandexMapManager.swift
//  lapki
//
//  Created by Максим Лейхнер on 23.11.2024.
//

import UIKit
import YandexMapsMobile
import CoreLocation

class YandexMapManager: NSObject, ObservableObject {
    
    @Published var userLocation: CLLocation? = nil
    @Published var cameraBounds: MapCameraBounds? = nil
    @Published var cameraMoving: Bool = false
    
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
