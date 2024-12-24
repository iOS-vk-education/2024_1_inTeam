//
//  AddPetView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 15.12.2024.
//

import SwiftUI

struct AddPetView: View {
    let viewModel: UserPetListViewModel
    @State private var selectedPetType: PetType = .cat
    @State private var selectedBreed: PetBreed = .catBreed(.bengal)
    @Binding var showToggle: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Выберите тип и породу вашего питомца")
                    .fontDesign(.rounded)
                
                Spacer()
                
                // TODO: При выборе породы после выбора типа, активный тип гаснет
                CustomSegmentedPicker(
                    selection: $selectedPetType,
                    options: [.cat, .dog, .other],
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
                            let catBreedBinding = Binding<CatBreed>(
                                get: {
                                    if case let .catBreed(breed) = selectedBreed {
                                        return breed
                                    }
                                    return .siamese
                                },
                                set: { newValue in
                                    selectedBreed = .catBreed(newValue)
                                }
                            )
                            
                            Picker("Порода кошки", selection: catBreedBinding) {
                                ForEach(CatBreed.allCases, id: \.self) { breed in
                                    Text(breed.rawValue).tag(breed)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(Color.Paws.Constant.uiAccent)
                        }
                        
                        if case .dog = selectedPetType {
                            let dogBreedBinding = Binding<DogBreed>(
                                get: {
                                    if case let .dogBreed(breed) = selectedBreed {
                                        return breed
                                    }
                                    return .goldenRetriever
                                },
                                set: { newValue in
                                    selectedBreed = .dogBreed(newValue)
                                }
                            )
                            
                            Picker("Порода собаки", selection: dogBreedBinding) {
                                ForEach(DogBreed.allCases, id: \.self) { breed in
                                    Text(breed.rawValue).tag(breed)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(Color.Paws.Constant.uiAccent)
                        }
                        
                        if case .other = selectedPetType {
                            let otherBreedBinding = Binding<String>(
                                get: {
                                    if case let .otherBreed(breed) = selectedBreed {
                                        return breed
                                    }
                                    return ""
                                },
                                set: { newValue in
                                    selectedBreed = .otherBreed(newValue)
                                }
                            )
                            
                            TextField("Введите породу", text: otherBreedBinding)
                                .tint(Color.Paws.Constant.uiAccent)
                        }
                    }
                }
                .padding()
                
                NavigationLink {
                    EnterPetDetailsView(showToggle: $showToggle,
                                        petType: selectedPetType,
                                        petBreed: selectedBreed,
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
            }
            .navigationTitle("Давайте знакомиться")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                        Text("Назад")
                    }
                    .foregroundStyle(Color.Paws.Constant.uiAccent)
                }
            }
            .toolbarBackground(Material.regular, for: .navigationBar)

        }
        .presentationBackground(Color.Paws.Background.background)
        .tint(Color.Paws.Constant.uiAccent)
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    self.hideKeyboard()
                }
        )
        .ignoresSafeArea(.keyboard)
    }
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

