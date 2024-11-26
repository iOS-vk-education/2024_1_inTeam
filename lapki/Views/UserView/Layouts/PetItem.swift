//
//  PetItem.swift
//  lapki
//
//  Created by Maxim Makarenkov on 06.11.2024.
//

import SwiftUI

struct PetItem: View {
    var pet: any Pet
    
    var body: some View {
        HStack {
            if let petImage = pet.imageURL {
                Image(petImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 52, height: 52)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(Color.Paws.Background.background, lineWidth: 3)
                    }
                    .shadow(color: Color.black.opacity(0.1), radius: 12)
            } else {
                Image(systemName: "cat.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 52)
            }
            VStack(alignment: .leading) {
                Text(pet.name)
                    .font(.headline)
                    .foregroundStyle(Color.Paws.Text.label)
                Text("\(pet.age) года, \(pet.breed.rawValue)")
                    .font(.callout)
                    .foregroundStyle(Color.Paws.Text.secondaryLabel)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(Color.Paws.Text.secondaryLabel)
        }
    }
}
