//
//  YandexMapManagerDelegate.swift
//  lapki
//
//  Created by Максим Лейхнер on 24.11.2024.
//

import YandexMapsMobile

protocol YandexMapManagerDelegate {
    func onCameraStartedMoving(with map: YMKMap)
    
    func onCameraStoppedMoving(with map: YMKMap)
}
