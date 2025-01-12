//
//  UserHeaderView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 17.11.2024.
//

import SwiftUI
import Swinject

struct UserHeaderView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showUserProfileView: Bool
    
    @State var authedUser = Container.authedUser
    
    var body: some View {
        HStack(alignment: .top) {
            Button {
                withAnimation(.spring) {
                    showUserProfileView.toggle()
                }
            } label: {
                HStack {
                    if let avatarURL =  authedUser.photoName {
                        Image(avatarURL)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color.Paws.Background.background, lineWidth: 3)
                            }
                            .shadow(color: Color.black.opacity(0.1), radius: 12)
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color.Paws.Background.background, lineWidth: 3)
                            }
                            .shadow(color: Color.black.opacity(0.1), radius: 12)
                            .foregroundStyle(Color.Paws.Text.label)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("\(authedUser.firstName) \(authedUser.lastName)")
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
