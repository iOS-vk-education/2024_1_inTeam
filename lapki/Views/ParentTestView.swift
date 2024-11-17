//
//  ParentTestView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 05.11.2024.
//

import SwiftUI

enum Sheet: String, Identifiable {
    case notifications, userView
    var id: String { rawValue }
}

struct ParentTestView: View {
    
    @State private var showSheet: Bool = false
    @State private var showNotifications: Bool = false
    @State private var settingsView: Bool = false
    @State private var appointmentsView: Bool = false
    
    @State private var sheet: Sheet?
    
    var body: some View {
        
        ZStack {
            Image("MainBG")
            VStack(spacing: 16) {
                Text("Testing UserView popover")
                Button("Toggle UserView") {
                    sheet = .userView
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(Material.thick)
            .cornerRadius(16)
        }
        .ignoresSafeArea()
        .sheet(item: $sheet, content: makeSheet)
    }
    
    @ViewBuilder
    func makeSheet(_ sheet: Sheet) -> some View {
        switch sheet {
        case .userView:
            UserView(showSheet: $showSheet, sheet: $sheet, appointments: $appointmentsView, settings: $settingsView)
        case .notifications:
            NotificationsView()
                .onDisappear {
                    self.sheet = .userView
                }
        }
    }
}

#Preview {
    ParentTestView()
}
