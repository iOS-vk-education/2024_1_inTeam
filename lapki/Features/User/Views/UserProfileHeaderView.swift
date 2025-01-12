//
//  UserProfileHeaderView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 22.11.2024.
//

import SwiftUI
import Swinject

struct UserProfileHeaderView: View {
    @State var authedUser = Container.authedUser
    
    var body: some View {
        HStack {
            if let avatarURL = authedUser.photoName {
                Image(avatarURL)
                    .resizable()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                Text("\(authedUser.firstName) \(authedUser.lastName)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(Color.Paws.Text.label)
                Text(authedUser.email)
                    .font(.subheadline)
                    .foregroundStyle(Color.Paws.Text.secondaryLabel)
            }
            Spacer()
        }
        .padding(16)
        .background(Color.Paws.Background.elevatedContainerBG)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.1), radius: 16)
    }
}
