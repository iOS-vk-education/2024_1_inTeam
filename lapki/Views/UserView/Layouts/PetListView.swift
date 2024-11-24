//
//  PetListView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 17.11.2024.
//

import SwiftUI

struct PetListView: View {
    let pets = PetManager.shared.MOCK_PETS
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .center) {
                Text("Питомцы")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(Color.Paws.Text.label)
                Spacer()
                Button {
                    // Add new pet
                } label: {
                    Text("Добавить")
                    Image(systemName: "plus")
                }
                .foregroundStyle(Color.Paws.Text.secondaryLabel)
            }
            .padding(.bottom, 24)
            VStack(spacing: 18) {
                ForEach(pets, id: \.id) { pet in
                    PetItem(pet: pet)
                        .padding(.vertical, 10)
                        .foregroundStyle(.foreground)
                }
            }
        }
    }
}

#Preview {
    PetListView()
}
