//
//  ModalButtonsSheetView.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 05.12.2024.
//

import SwiftUI

struct ModalButtonsSheetView: View, Equatable {
    let id: UUID = UUID()
    var firstRow: [AnyView]
    var secondRow: [AnyView]
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                ForEach(0..<firstRow.count, id: \.self) { index in
                    firstRow[index]
                }
            }
            HStack(spacing: 12) {
                ForEach(0..<secondRow.count, id: \.self) { index in
                    secondRow[index]
                }
            }
            Spacer()
        }
    }
    
    static func == (lhs: ModalButtonsSheetView, rhs: ModalButtonsSheetView) -> Bool {
        lhs.id == rhs.id
    }
}

#Preview {
    ModalButtonsSheetView(firstRow: [AnyView(
        MainModalButton(buttonType: .large, bgColor: .blue) {
            Text("Места для прогулок")
                .font(.largeTitle)
                .foregroundColor(Color.Paws.Text.label)
        } content: {
            Text("5 рядом с вами")
                .foregroundStyle(.white)
        } image: {
            Image("dogImage")
        } action: {
            
        })], secondRow: [AnyView(
            MainModalButton(buttonType: .small, bgColor: .yellow) {
                Text("Ветклиники")
                    .foregroundColor(Color.Paws.Text.label)
                    .font(.largeTitle)
            } content: {
                EmptyView()
            } image: {
                Image("dogImage")
            } action: {
                
            }
        ), AnyView(
            MainModalButton(buttonType: .tiny, bgColor: .green) {
                Text("Бешенство")
                    .foregroundColor(Color.Paws.Text.label)
                    .bold()
                    .font(.largeTitle)
            } content: {
                VStack {
                    Text("Подробнее")
                }
                .foregroundColor(Color.Paws.Text.label)
            } action: {
                
            }
        )])
}
