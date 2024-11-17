//
//  SettingsView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var offset: CGFloat = 0
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white) // Белый прямоугольник
            .shadow(radius: 10)
            .overlay(
                NavigationView {
                    VStack {
                        Text("Hello, World!")
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark.circle")
                            }
                        }
                    }
                    .navigationTitle("Настройки")
                    .navigationBarTitleDisplayMode(.large)
                }
                    .background(Color.clear)
            )
            .offset(y: offset) // Применяем смещение к всему NavigationView
            .scaleEffect(scale) // Масштабирование окна
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        // Изменяем offset и scale в зависимости от высоты свайпа
                        if gesture.translation.height > 0 {
                            offset = gesture.translation.height
                            scale = 1 - (gesture.translation.height / 1000) // Плавное уменьшение
                        }
                    }
                    .onEnded { gesture in
                        if gesture.translation.height > 200 { // Условие закрытия
                            dismiss()
                        } else {
                            withAnimation(.spring()) {
                                offset = 0
                                scale = 1.0 // Возвращаем в исходное состояние
                            }
                        }
                    }
            )
            .ignoresSafeArea()
            .presentationBackground(Color.clear)
    }
}

#Preview {
    SettingsView()
}
