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
    
    init(header: String = "", footer: String = "", @ViewBuilder content: () -> Content) {
        self.header = header
        self.footer = footer
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(header)
                .font(.subheadline)
                .foregroundStyle(Color.Paws.Text.secondarySubhead)
                .padding(.horizontal, 16)
                .padding(.top, 8)
            VStack {
                content
                    .padding(.horizontal, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 8)
            }
            .foregroundStyle(Color.Paws.Text.label)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.Paws.Background.elevatedContainerBG)
            .cornerRadius(24)
        }
    }
}

#Preview {
    SectionView(header: "Название секции") {
        NavigationLink {
            
        } label: {
            Text("Какой-нибудь текст")
        }
        NavigationLink {
            
        } label: {
            Text("Еще текст")
        }
    }
}
