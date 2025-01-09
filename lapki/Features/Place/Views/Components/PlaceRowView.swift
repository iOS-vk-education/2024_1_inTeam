//
//  PlaceRowView.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 06.12.2024.
//

import SwiftUI

struct PlaceRowView: View {
    let place: Place
    
    var body: some View {
        HStack(spacing: 14) {
            PlaceIconBuilder(placeType: place.type)
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.headline)
                    .foregroundStyle(Color.Paws.Text.label)
                Text(place.type.rawValue)
                    .font(.subheadline)
                    .foregroundStyle(Color.Paws.Text.secondaryLabel)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 29, height: 29)
                .scaledToFit()
                .padding()
                .foregroundStyle(Color.Paws.Text.secondaryLabel)
        }
    }
}

