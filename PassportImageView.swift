//
//  PassportImageView.swift
//  lapki
//
//  Created by 596 on 07.12.2024.
//

import SwiftUI

struct PassportImageView: View {
    var body: some View {
        ScrollView{
                ZStack(alignment: .center){
                    Image("image_passport")
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                }
                .navigationTitle("Паспорт")
                .padding(.vertical)
                .padding(.horizontal)
        }
    }
}

//#Preview {
//    NavigationStack{
//        PassportImageView()
//    }
//}
