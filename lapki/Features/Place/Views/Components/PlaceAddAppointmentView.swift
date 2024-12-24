//
//  PlaceCardView.swift
//  lapki
//
//  Created by Максим Лейхнер on 24.11.2024.
//

import SwiftUI

struct PlaceAddAppointmentView: View {
    
    @ObservedObject var viewModel: PlaceViewModel
    var addAppendAction: () -> Void
    
    var body: some View {
        VStack (alignment: .center) {
            Text("Записались на прием?")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .padding(.vertical, 4)
            Text("Добавьте напоминание, чтобы не забыть")
                .font(.system(size: 16, design: .rounded))
            DatePicker("Выберите дату", selection: $viewModel.date, in: Date()...)
                .datePickerStyle(.graphical)
                .accentColor(Color.Paws.Constant.uiAccent)
            
            Divider()
            HStack {
                Text("Выберите питомца")
                    .font(.system(size: 16, design: .rounded))
                    .padding(.leading)
                Spacer()
                Picker("Выберите питомца", selection: $viewModel.pet, content: {
                    ForEach(viewModel.pets) { pet in
                        Text(pet.name)
                            .tag(pet)
                    }
                })
                .pickerStyle(.menu)
            }
            .padding(.vertical)
            
            Button(action: {
                addAppendAction()
            }, label: {
                HStack {
                    Text("Создать напоминание")
                        .font(.system(size: 20, design: .rounded))
                        .foregroundStyle(Color.Paws.Background.background)
                    Image(systemName: "pencil")
                        .foregroundStyle(Color.Paws.Background.background)
                }
                .padding(.vertical, 18)
                .frame(maxWidth: .infinity)
                .background(Color.Paws.Constant.uiAccent)
                .cornerRadius(37)
            })
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 13)
        .padding(.top, 15)
        .frame(maxHeight: .infinity)
        .background(Color.Paws.Background.background)
    }
}

