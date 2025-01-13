//
//  UserEditView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 12.01.2025.
//

import SwiftUI
import Swinject

struct UserEditView: View {
    @StateObject var viewModel = UserViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            SectionView() {
                HStack {
                    Text("Имя")
                    .frame(width: 120, alignment: .leading)
                    TextField("Введите имя", text: $viewModel.user.firstName)
                }
                HStack {
                    Text("Фамилия")
                        .frame(width: 120, alignment: .leading)
                    TextField("Введите фамилию", text: $viewModel.user.lastName)
                }
            }
            .padding(.horizontal, 12)
            Spacer()
        }
        .background(Color.Paws.Background.background)
        .navigationTitle("Редактирование")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if viewModel.saveChanges() {
                        dismiss()
                    }
                } label: {
                    Text("Сохранить")
                }
            }
        }
    }
}
