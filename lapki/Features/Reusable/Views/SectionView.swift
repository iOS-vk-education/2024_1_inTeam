//
//  SectionView.swift
//  lapki
//
//  Created by Maxim Makarenkov on 25.11.2024.
//

import SwiftUI

struct SectionView<Content: View>: View {
    var header: String
    var content: Content
    var footer: String
    var leadPadding: Bool
    
    init(header: String = "", footer: String = "", @ViewBuilder content: () -> Content, leadPadding: Bool = false) {
        self.header = header
        self.footer = footer
        self.content = content()
        self.leadPadding = leadPadding
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if header != "" {
                Text(header)
                    .font(.subheadline)
                    .foregroundStyle(Color.Paws.Text.secondarySubhead)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
            }
            VStack(alignment: .leading) {
                content
                    .padding(.leading, leadPadding ? 12 : 0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 8)
            }
            .foregroundStyle(Color.Paws.Text.label)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.Paws.Background.elevatedContainerBG)
            .cornerRadius(24)
        }
        .shadow(color: Color.black.opacity(0.1), radius: 5)
    }
}
