//
//  PetListView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 17.11.2024.
//

import SwiftUI

struct PetListView: View {
    @ObservedObject var viewModel: UserPetListViewModel
    @State private var showAddPet: Bool = false
    
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
                    showAddPet.toggle()
                } label: {
                    Text("Добавить")
                    Image(systemName: "plus")
                }
                .foregroundStyle(Color.Paws.Text.secondaryLabel)
            }
            .padding(.bottom, 24)
            VStack(spacing: 18) {
                if viewModel.pets.isEmpty {
                    VStack(spacing: 4) {
                        Text("У вас пока нет питомцев.")
                        Text("Самое время добавить!")
                            .bold()
                    }
                } else {
                    ForEach(viewModel.pets, id: \.id) { pet in
                        PetItem(pet: pet)
                            .padding(.vertical, 10)
                            .foregroundStyle(.foreground)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showAddPet, content: { AddPetView(viewModel: viewModel, showToggle: $showAddPet) })
    }
}
