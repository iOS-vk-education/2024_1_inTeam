//
//  MedCardImageView.swift
//  lapki
//
//  Created by 596 on 08.12.2024.
//

import SwiftUI

struct MedCardImageView: View {
    var body: some View {
        ScrollView{
                ZStack(alignment: .center){
                    Image("medcard_image")
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                }
                .navigationTitle("Медицинская карта")
                .padding(.vertical)
                .padding(.horizontal)
        }
    }
}
