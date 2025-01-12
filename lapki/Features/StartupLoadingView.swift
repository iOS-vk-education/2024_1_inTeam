//
//  StartupLoadingView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 12.01.2025.
//

import SwiftUI

struct StartupLoadingView: View {
    var body: some View {
        VStack {
            Image("logo")
        }
        ProgressView()
            .progressViewStyle(.circular)
    }
}
