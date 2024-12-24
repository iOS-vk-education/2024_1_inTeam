//
//  MainTabView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.12.2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MainMapView()
                .tabItem {
                    Image(systemName: "map")
                        .environment(\.symbolVariants, .none)
                    Text("Карта")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.Paws.Background.background, for: .tabBar)
        }
        .tint(Color.Paws.Constant.uiAccent)
    }
}
