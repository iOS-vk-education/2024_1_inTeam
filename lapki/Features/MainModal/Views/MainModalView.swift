//
//  MainModalView.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 03.12.2024.
//

import SwiftUI
import Swinject

struct MainModalView: View {
    @StateObject var viewModel = MainModalViewModel()
    @ObservedObject var mapViewModel: MainMapViewModel
    private let placeRepository = Container.placeRepository
    var body: some View {
        VStack {
            if mapViewModel.searchFieldActive {
                ScrollView {
                    ForEach(mapViewModel.results, id: \.id) { place in
                        Button {
                            mapViewModel.placeInfo = placeRepository.fetchById(id: place.id)
                            mapViewModel.showPlaceInfo.toggle()
                        } label: {
                            PlaceRowView(place: place)
                                .padding(.horizontal, 18)
                                .foregroundStyle(Color.Paws.Text.label)
                        }
                        .transition(.slide.combined(with: .opacity))
                        .animation(.smooth, value: mapViewModel.results.count)
                    }
                }
                
            } else {
                VStack(spacing: 20) {
                    ScrollView(showsIndicators: false) {
                        ButtonCarouselView(viewModel: viewModel)
                        FavouritePlacesView(viewModel: mapViewModel)
                            .padding(.horizontal, 18)
                    }
                }
            }
        }
        .animation(nil, value: mapViewModel.searchFieldActive)
    }
}
