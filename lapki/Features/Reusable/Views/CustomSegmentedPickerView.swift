//
//  CustomSegmentedPickerView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 15.12.2024.
//

import SwiftUI

struct CustomSegmentedPicker<T: Hashable>: View {
    @Binding var selection: T
    let options: [T]
    let labelProvider: (T) -> String
    let imageProvider: (T) -> Image?
    let spacing: CGFloat
    let activeColor: Color
    let inactiveColor: Color
    let cornerRadius: CGFloat
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    withAnimation {
                        selection = option
                    }
                }) {
                    VStack {
                        if let image = imageProvider(option) {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        Text(labelProvider(option))
                    }
                    .fontDesign(.rounded)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity)
                    .background(selection == option ? activeColor : inactiveColor)
                    .foregroundColor(selection == option ? .white : .black)
                    .cornerRadius(cornerRadius)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                }
            }
        }
    }
}
