//
//  YandexMapView.swift
//  lapki
//
//  Created by Максим Лейхнер on 23.11.2024.
//

import UIKit
import SwiftUI
import YandexMapsMobile

struct YandexMapView: UIViewRepresentable {
    
    @EnvironmentObject var manager: YandexMapManager
    
    func makeUIView(context: Context) -> YMKMapView {
        return manager.mapView
    }
    
    func updateUIView(_ uiView: YMKMapView, context: Context) {}
}
