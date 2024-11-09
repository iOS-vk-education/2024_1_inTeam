//
//  PetItem.swift
//  lapki
//
//  Created by Maxim Makarenkov on 06.11.2024.
//

import SwiftUI

struct PetItem: View {
    var body: some View {
        HStack {
            Image(systemName: "cat.circle")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            VStack(alignment: .leading) {
                Text("Барсик")
                    .font(.headline)
                Text("4 года, дворняга")
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
            Spacer()
            NavigationLink {
                
            } label: {
                Image(systemName: "chevron.right")
            }
        }
    }
}

#Preview {
    PetItem()
}
