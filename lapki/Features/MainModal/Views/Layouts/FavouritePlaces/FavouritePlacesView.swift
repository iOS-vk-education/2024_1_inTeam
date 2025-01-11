//
//  FavouritePlacesView.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 06.12.2024.
//

import SwiftUI
import Swinject

struct FavouritePlacesView: View {
    let placeRepository = Container.placeRepository
    @State var showPlace: Bool = false
    @State var selectedPlace: Place?
    @ObservedObject var viewModel: MainMapViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Любимые места")
                    .font(.largeTitle)
                    .fontDesign(.rounded)
                    .foregroundStyle(Color.Paws.Text.label)
                    .bold()
                Spacer()
            }
            VStack(spacing: 16) {
                ForEach(placeRepository.filter(by: PlaceFavouriteSpecification()), id: \.id) { place in
                    Button {
                        viewModel.placeInfo = place
                        viewModel.showPlaceInfo = true
                    } label: {
                        FavouritePlaceRowView(place: place)
                            .foregroundStyle(.foreground)
                    }
                }
            }
        }
        .padding(.bottom, 100)
    }
}
