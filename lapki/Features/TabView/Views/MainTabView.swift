//
//  MainTabView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.12.2024.
//

import SwiftUI
import BottomSheetSwiftUI

struct MainTabView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .relativeTop(0.9)
    
    var body: some View {
        TabView {
            MainMapView()
                .bottomSheet(bottomSheetPosition: $bottomSheetPosition, switchablePositions: [.relativeTop(0.9), .relativeBottom(0.2)]) {
                    SearchBarView()
                        .padding(.horizontal, 18)
                        .padding(.bottom, 18)
                } mainContent: {
                    ContentView()
                }
                .customAnimation(.spring())
                .customBackground(
                    Color.Paws.Background.background
                        .shadow(color: .black.opacity(0.1), radius: 10)
                        .clipShape(.rect(
                            topLeadingRadius: 36,
                            topTrailingRadius: 36
                        ))
                )
                .tabItem {
                    Image(systemName: "map")
                        .environment(\.symbolVariants, .none)
                    Text("Карта")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.Paws.Background.background, for: .tabBar)
            Text("Friends")
                .backgroundStyle(Color.Paws.Background.background)
                .tabItem {
                    Image(systemName: "pawprint")
                        .environment(\.symbolVariants, .none)
                    Text("Друзья")
                }
                .toolbarBackground(Color.Paws.Background.background, for: .tabBar)
        }
    }
}

#Preview {
    MainTabView()
}
