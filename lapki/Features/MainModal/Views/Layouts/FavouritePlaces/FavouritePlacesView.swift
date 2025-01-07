//
//  FavouritePlacesView.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 06.12.2024.
//

import SwiftUI

struct FavouritePlacesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Любимые места")
                .font(.largeTitle)
                .fontDesign(.rounded)
                .foregroundStyle(Color.Paws.Text.label)
                .bold()
            VStack(spacing: 20) {
                ForEach(0..<5) { _ in
                    FavouritePlaceRowView()
                }
            }
        }
    }
}

#Preview {
    FavouritePlacesView()
}
