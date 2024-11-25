//
//  PlaceCardView.swift
//  lapki
//
//  Created by Максим Лейхнер on 24.11.2024.
//

import SwiftUI
import Glur

struct PlaceCardView: View {
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .aspectRatio(1.6, contentMode: .fit)
            .background {
                Image("TestClinic")
                    .resizable()
                    .scaledToFill()
                    .clipped()
            }
            .glur(
                offset: 0.6
            )
            .overlay {
                VStack {
                    Spacer()
                    HStack(spacing: 12) {
                        Circle()
                            .fill(Color.Paws.Content.purple)
                            .frame(width: 48, height: 48)
                            .overlay {
                                Image(systemName: "cross.fill")
                                    .font(.system(size: 24))
                            }
                        VStack(alignment: .leading) {
                            Text("Красногвардейская ВЛ")
                                .font(.system(size: 20, weight: .medium, design: .rounded))
                                .lineLimit(1)
                                .foregroundStyle(Color.Paws.Constant.white)
                            Text("Ветеринарное учреждение")
                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                .lineLimit(1)
                                .foregroundStyle(Color.Paws.Constant.secondaryWhite)
                        }
                        Spacer(minLength: 0)
                        Button(action: {}) {
                            Image(systemName: "phone")
                                .font(.system(size: 24, weight: .regular))
                                .tint(Color.Paws.Constant.white)
                        }
                    }
                    .padding(12)
                }
                
            }
            .clipped()
            .cornerRadius(12)
            .onTapGesture {
                print("Tap")
            }
    }
}

#Preview {
    PlaceCardView()
        .padding(20)
}
