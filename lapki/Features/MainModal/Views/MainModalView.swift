//
//  MainModalView.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 03.12.2024.
//

import SwiftUI

struct MainModalView: View {
    @StateObject var viewModel = MainModalViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            ScrollView(showsIndicators: false) {
                ButtonCarouselView(viewModel: viewModel)
                FavouritePlacesView()
                    .padding(.horizontal, 18)
            }

        }
    }
}
