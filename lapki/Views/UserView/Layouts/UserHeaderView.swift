//
//  UserHeaderView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 17.11.2024.
//

import SwiftUI

struct UserHeaderView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack() {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text("Максим Лейхнер")
                        .font(.headline)
                        .fontDesign(.rounded)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.Paws.Text.label)
                    Text("Ваш аккаунт")
                        .font(.footnote)
                        .fontDesign(.rounded)
                        .foregroundStyle(Color.Paws.Text.secondaryLabel)
                }
            }
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.subheadline)
                    .foregroundStyle(Color.Paws.Text.labelInContainer)
                    .padding(6)
                    .background(Color.Paws.Background.containerOnBackground)
                    .clipShape(Circle())
            }
        }
    }
}

#Preview {
    UserHeaderView()
}
