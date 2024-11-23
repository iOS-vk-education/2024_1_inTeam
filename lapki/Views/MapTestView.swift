//
//  MapTestView.swift
//  lapki
//
//  Created by Максим Лейхнер on 23.11.2024.
//

import SwiftUI

struct MapTestView: View {
    @ObservedObject var mapManager = YandexMapManager()
    
    var body: some View {
        ZStack {
            YandexMapView()
                .edgesIgnoringSafeArea(.all)
                .environmentObject(mapManager)
            VStack {
                Button("Move to User") {
                    mapManager.moveMapToUserLocation()
                }
                Text("Camera Moves: \(mapManager.cameraMoving)")
            }
        }
    }
}

#Preview {
    MapTestView()
}
