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
            Image(systemName: "cat.circle")
                .resizable()
                .scaledToFit()
                .frame(height: 52)
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

#Preview {
    PetItem(pet: PetManager.shared.MOCK_PETS[0])
}
