//
//  SearchBarView.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 04.12.2024.
//

import SwiftUI
import Swinject

struct SearchBarView: View {
    @State var text = ""
    @ObservedObject var viewModel: MainMapViewModel
    @FocusState var isFocused
    @State var showCancelButton: Bool = false

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField(text: $text) {
                    Text("Поиск")
                }
                .focused($isFocused)
                Spacer()
            }
            .foregroundStyle(.gray.opacity(0.5))
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .frame(height: 46)
            .frame(maxWidth: .infinity)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .onChange(of: isFocused) { state in
                viewModel.searchFieldActive = state
                withAnimation {
                    showCancelButton = state
                }
            }
            .onChange(of: text) { newText in
                if newText.isEmpty {
                    viewModel.results = []
                    return
                }
                viewModel.results = viewModel.repository.filter(by: PlaceNameSpecification(keyword: newText))
            }
            if showCancelButton {
                Button {
                    text = ""
                    isFocused = false
                    withAnimation {
                        showCancelButton = false
                    }
                } label: {
                    Text("Отмена")
                }
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
                
        }
        
    }
}
