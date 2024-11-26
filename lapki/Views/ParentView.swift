//
//  ParentView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 05.11.2024.
//

import SwiftUI

struct ParentView: View {
    
    @Binding var showUserView: Bool
    
    
    var body: some View {
        ZStack {
            Color.clear
        }
        .sheet(isPresented: $showUserView) {
            UserView()
        }
    }
}

//#Preview {
//    ParentView()
//}
