//
//  AppointmentRowView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 20.11.2024.
//

import SwiftUI

struct AppointmentRowView: View {
    
    var appointment: AppointmentModel
    
    var body: some View {
        HStack {
            if let imagePath = appointment.pet.imageURL {
                Image(imagePath)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
            } else {
                Image(systemName: "cat.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
            }
            
            VStack(alignment: .leading) {
                Text("Красногвардейская ВЛ")
                    .font(.headline)
                HStack(spacing: 16) {
                    Text("\(appointment.pet.name)")
                    Text("\(appointment.date.formatted(.dateTime))")
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

#Preview {
    AppointmentRowView(appointment: AppointmentManager.shared.MOCK_APPOINTMENTS[0])
}
