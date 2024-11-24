//
//  ParentView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 05.11.2024.
//

import SwiftUI

struct ParentView: View {
    
    @State private var showUserView: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    Text("Testing UserView popover")
                    Button("Toggle UserView") {
                        showUserView.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Material.thick)
                .cornerRadius(16)
                .sheet(isPresented: $showUserView) {
                    UserView()
                }
            }
        }
    }
}

#Preview {
    ParentView()
}
