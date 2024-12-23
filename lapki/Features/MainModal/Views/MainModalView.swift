//
//  MainModalView.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 03.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            ScrollView(showsIndicators: false) {
                ButtonCarouselView()
                FavouritePlacesView()
                    .padding(.horizontal, 18)
                    .padding(.bottom, 50)
            }

        }
    }
}

#Preview {
    ContentView()
}
