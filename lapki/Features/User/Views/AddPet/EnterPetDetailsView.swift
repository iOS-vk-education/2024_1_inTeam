//
//  EnterPetDetailsView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 15.12.2024.
//

import SwiftUI

struct EnterPetDetailsView: View {
    @State var petName: String = ""
    @State var petAge: Int = 0
    @Binding var showToggle: Bool
    
    let petType: PetType
    
    let viewModel: UserPetListViewModel
    
    var body: some View {
        VStack {
            SectionView {
                HStack(spacing: 24) {
                    Text("Имя")
                    Spacer()
                    TextField("Введите имя", text: $petName)
                }
            }
            .padding()
            
            SectionView {
                HStack {
                    Text("Возраст")
                    Spacer()
                    Picker("Возраст", selection: $petAge) {
                        ForEach(0...50, id: \.self) { age in
                            Text("\(age) лет").tag(age)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 60)
                }
            }
            .padding()
            
            Spacer()
            NavigationLink {
                FinishAddPetView(showToggle: $showToggle,
                                 petName: petName,
                                 petAge: petAge,
                                 petType: petType,
                                 viewModel: viewModel)
            } label: {
                Text("Далее")
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(Color.Paws.Constant.uiAccent)
            Image("SimpleCatDog")
                .resizable()
                .frame(width: 250, height: 250)
        }
        .navigationTitle("Укажите данные")
        .navigationBarTitleDisplayMode(.large)
        .background(Color.Paws.Background.background)
    }
}
