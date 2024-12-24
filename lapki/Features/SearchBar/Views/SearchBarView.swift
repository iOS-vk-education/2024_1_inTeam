//
//  SearchBarView.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 04.12.2024.
//

import SwiftUI

struct SearchBarView: View {
    @State var isActive = false
    @State var text = ""
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField(text: $text) {
                    Text("Поиск")
                }
                Spacer()
            }
            .onTapGesture {
                if !isActive {
                    withAnimation {
                        isActive = true
                    }
                }
            }
            .foregroundStyle(.gray.opacity(0.5))
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .frame(height: 46)
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            if isActive {
                HStack {
                    Button {
                        withAnimation {
                            isActive = false
                        }
                    } label: {
                        Text("Отмена")
                    }
                }
                .transition(.move(edge: .trailing))
            }
        }
        
    }
}

#Preview {
    SearchBarView()
}
