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
                Text("<Place_name>")
                    .font(.headline)
                Text("\(appointment.date.formatted(.dateTime))")
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
        .background(Color("Paws 1/bebra"))
    }
}

#Preview {
    AppointmentRowView(appointment: AppointmentManager.shared.MOCK_APPOINTMENTS[0])
}
