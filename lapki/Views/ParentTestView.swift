//
//  ParentTestView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 05.11.2024.
//

import SwiftUI

struct ParentTestView: View {
    @State private var showSheet: Bool = false
    @State private var detent = PresentationDetent.medium
    
    var body: some View {
        ZStack {
            Image("MainBG")
                .resizable()
            VStack(spacing: 16) {
                Text("Testing UserView popover")
                Button("Toggle UserView") {
                    showSheet.toggle()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(Material.thick)
            .cornerRadius(16)
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showSheet) {
            UserSheet(showSheet: $showSheet, detent: $detent)
                .onDisappear {
                    detent = .medium
                }
                .presentationContentInteraction(.scrolls)
        }
        
    }
}

#Preview {
    ParentTestView()
}
