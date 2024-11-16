//
//  ParentTestView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 05.11.2024.
//

import SwiftUI

struct ParentTestView: View {
    @State private var showSheet: Bool = false
    @State private var settingsView: Bool = false
    @State private var appointmentsView: Bool = false
    
    var body: some View {
        NavigationStack {
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
                UserView(showSheet: $showSheet, appointments: $appointmentsView, settings: $settingsView)
            }
            .navigationDestination(isPresented: $settingsView) {
                SettingsView()
                    .onDisappear {
                        showSheet = true
                    }
            }
            .navigationDestination(isPresented: $appointmentsView) {
                AppointmentsView()
                    .onDisappear {
                        showSheet = true
                    }
            }
        }
    }
}

#Preview {
    ParentTestView()
}
