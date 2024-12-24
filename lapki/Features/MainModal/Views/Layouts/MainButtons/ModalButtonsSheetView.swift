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
