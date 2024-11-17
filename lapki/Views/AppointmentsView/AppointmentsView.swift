//
//  AppointmentsView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.11.2024.
//

import SwiftUI

struct AppointmentsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
                .navigationTitle("Мои записи")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark.circle")
                                    .foregroundStyle(.foreground)
                            }
                        }
                    }
                    ToolbarTitleMenu {
                        Button {
                            
                        } label: {
                            Text("bebra")
                                .foregroundStyle(.foreground)
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    AppointmentsView()
}
