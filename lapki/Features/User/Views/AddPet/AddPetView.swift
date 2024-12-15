//
//  AddPetView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 15.12.2024.
//

import SwiftUI

struct AddPetView: View {
    let viewModel: UserPetListViewModel
    @State private var selectedPetType: PetType = .cat(.siamese)
    @State private var selectedCatBreed: CatBreed = .siamese
    @State private var selectedDogBreed: DogBreed = .goldenRetriever
    @State private var selectedOtherBreed: String = "Без породы"
    @State private var petName: String = ""
    @State private var petAge: Int = 0
    @Binding var showToggle: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Выберите тип и породу вашего питомца")
                    .fontDesign(.rounded)
                
                Spacer()
                
                // TODO: При выборе породы после выбора типа, активный тип гаснет
                CustomSegmentedPicker(
                    selection: $selectedPetType,
                    options: [.cat(selectedCatBreed), .dog(selectedDogBreed), .other(selectedOtherBreed)],
                    labelProvider: { type in
                        switch type {
                        case .cat:
                            return "Кот"
                        case .dog:
                            return "Собака"
                        case .other:
                            return "Другое"
                        }
                    },
                    imageProvider: { type in
                        switch type {
                        case .cat:
                            return Image(systemName: "cat.fill")
                        case .dog:
                            return Image(systemName: "dog.fill")
                        case .other:
                            return Image(systemName: "pawprint.fill")
                        }
                    },
                    spacing: 8,
                    activeColor: Color.Paws.Constant.uiAccent,
                    inactiveColor: Color.Paws.Background.elevatedContainerBG,
                    cornerRadius: 18
                )
                .padding()
                SectionView {
                    HStack(spacing: 24) {
                        Text("Порода")
                        Spacer()
                        if case .cat = selectedPetType {
                            Picker("Порода кошки", selection: $selectedCatBreed) {
                                ForEach(CatBreed.allCases, id: \.self) { breed in
                                    Text(breed.rawValue).tag(breed)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(Color.Paws.Constant.uiAccent)
                        }
                        if case .dog = selectedPetType {
                            Picker("Порода собаки", selection: $selectedDogBreed) {
                                ForEach(DogBreed.allCases, id: \.self) { breed in
                                    Text(breed.rawValue).tag(breed)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(Color.Paws.Constant.uiAccent)
                        }
                        if case .other = selectedPetType {
                            TextField("Введите породу", text: $selectedOtherBreed)
                        }
                    }
                }
                .padding()
                
                Spacer()
                NavigationLink {
                    EnterPetDetailsView(showToggle: $showToggle,
                                        petType: selectedPetType,
                                        viewModel: viewModel
                    )
                } label: {
                    Text("Далее")
                        .padding(.horizontal, 32)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .tint(Color.Paws.Constant.uiAccent)
                Image("SimpleCatDog")
                    .resizable()
                    .frame(width: 250, height: 250)
            }
            .navigationTitle("Давайте знакомиться")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                        Text("Назад")
                    }
                    .foregroundStyle(Color.Paws.Constant.uiAccent)
                }
            }
            .toolbarBackground(Material.thinMaterial, for: .navigationBar)
        }
        .presentationBackground(Color.Paws.Background.background)
        .tint(Color.Paws.Constant.uiAccent)
    }
}

