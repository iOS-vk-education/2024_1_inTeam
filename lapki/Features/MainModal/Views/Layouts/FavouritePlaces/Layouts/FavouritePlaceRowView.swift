//
//  FavouritePlaceRowView.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 06.12.2024.
//

import SwiftUI

struct FavouritePlaceRowView: View {
    
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: "cross.fill")
                .resizable()
                .scaledToFit()
                .padding(11)
                .background(Color.Paws.Content.purple)
                .clipShape(Circle())
                .frame(width: 48, height: 48)
            VStack(alignment: .leading) {
                Text("Красногвардейская ВЛ")
                    .font(.headline)
                    .foregroundStyle(Color.Paws.Text.label)
                Text("Ветеринарное учреждение")
                    .font(.subheadline)
                    .foregroundStyle(Color.Paws.Text.secondaryLabel)
            }
            Spacer()
            Image(systemName: "phone")
                .resizable()
                .frame(width: 29, height: 29)
                .scaledToFit()
                .padding()
                .foregroundStyle(Color.Paws.Text.label)
        }
    }
}

#Preview {
    FavouritePlaceRowView()
}
