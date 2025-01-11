//
//  FavouritePlaceRowView.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 06.12.2024.
//

import SwiftUI

struct FavouritePlaceRowView: View {
    let place: Place
    
    var body: some View {
        HStack(spacing: 14) {
            PlaceIconBuilder(placeType: place.type)
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.Paws.Text.label)
                Text(place.type.rawValue)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.Paws.Text.secondaryLabel)
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "phone")
                    .resizable()
                    .frame(width: 29, height: 29)
                    .scaledToFit()
                    .padding()
                    .foregroundStyle(Color.Paws.Text.label)
            }
        }
    }
}
