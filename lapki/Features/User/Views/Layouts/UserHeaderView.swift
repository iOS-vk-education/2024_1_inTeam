//
//  UserHeaderView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 17.11.2024.
//

import SwiftUI

struct UserHeaderView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showUserProfileView: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            Button {
                withAnimation(.spring) {
                    showUserProfileView.toggle()
                }
            } label: {
                HStack {
                    Image("sample")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(Color.Paws.Background.background, lineWidth: 3)
                        }
                        .shadow(color: Color.black.opacity(0.1), radius: 12)
                    VStack(alignment: .leading) {
                        Text("Константин Кулаков")
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
