//
//  AppointmentRowView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 20.11.2024.
//

import SwiftUI

struct AppointmentRowView: View {
    
    let appointment: AppointmentModel
    
    var body: some View {
        HStack {
            if let imagePath = appointment.pet.imageURL {
                Image(imagePath)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
            } else {
                Image(systemName: "pawprint.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
            }
            
            VStack(alignment: .leading) {
                Text(appointment.place.name)
                    .font(.headline)
                    .lineLimit(1)
                HStack(spacing: 16) {
                    Text(appointment.pet.name)
                    Text(appointment.date.formatted(.dateTime))
                }
                .font(.callout)
                .foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.Paws.Background.elevatedContainerBG)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.1), radius: 10)
    }
}
