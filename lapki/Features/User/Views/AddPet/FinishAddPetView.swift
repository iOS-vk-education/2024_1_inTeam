//
//  FinishAddPetView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 15.12.2024.
//

import SwiftUI

struct FinishAddPetView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var showToggle: Bool
    
    let petName: String
    let petAge: Int
    let petType: PetType
    let petBreed: PetBreed
    let viewModel: UserPetListViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Text("Ваш питомец добавлен")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Вы можете добавить фото и изменить информацию о нем в профиле питомца")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            Image("SimpleCatDog")
                .resizable()
                .frame(width: 250, height: 250)
            
            Spacer()
            
            Button {
                showToggle.toggle()
            } label: {
                Text("Готово")
                    .padding(.horizontal, 32)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(Color.Paws.Constant.uiAccent)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden()
        .background(Color.Paws.Background.background)
        .onAppear {
            let pet = Pet(id: UUID().uuidString, name: petName, age: petAge, type: petType, enumBreed: petBreed)
            viewModel.addPet(pet)
        }
    }
}
