//
//  MainModalViewModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 07.01.2025.
//

import Foundation
import SwiftUI

class MainModalViewModel: ObservableObject {
    
    let pages = [
        ModalButtonsSheetView(firstRow: [AnyView(
            MainModalButton(buttonType: .large, bgColor: Color.Paws.Content.yellow) {
                Text("Места для прогулок")
                    .foregroundColor(Color.Paws.Constant.black)
                    .font(.custom("Moloko", size: 48))
            } content: {
                Text("5 рядом с вами")
                    .foregroundColor(Color.Paws.Constant.white)
            } image: {
                Image("dogImage")
            } action: {
                print("Tap")
            })], secondRow: [AnyView(
                MainModalButton(buttonType: .small, bgColor: Color.Paws.Content.pink) {
                    Text("Ветклиники")
                        .foregroundColor(Color.Paws.Constant.black)
                        .font(.custom("Moloko", size: 36))
                } content: {
                    EmptyView()
                } image: {
                    Image("dogImage2")
                } action: {
                    
                }
            ), AnyView(
                MainModalButton(buttonType: .tiny, bgColor: Color.Paws.Content.purple) {
                    Text("Бешенство")
                        .foregroundColor(Color.Paws.Constant.white)
                        .bold()
                        .font(.custom("Moloko", size: 36))
                } content: {
                    VStack {
                        Text("Подробности")
                            .lineLimit(1)
                            .minimumScaleFactor(0.6)
                            .foregroundStyle(Color.Paws.Text.label)
                        Text("Открыть")
                            .foregroundStyle(Color.Paws.Text.label)
                    }
                    .foregroundColor(Color.Paws.Constant.white)
                } action: {
                    
                }
            )]),
        ModalButtonsSheetView(firstRow: [AnyView(
            MainModalButton(buttonType: .large, direction: .reversed, bgColor: Color.Paws.Content.green) {
                Text("Места для прогулок")
                    .font(.custom("Moloko", size: 48))
                    .foregroundColor(Color.Paws.Constant.black)
            } content: {
                Text("5 рядом с вами")
                    .foregroundColor(Color.Paws.Constant.white)
            } image: {
                Image("dogImage3")
            } action: {
                
            })], secondRow: [AnyView(
                MainModalButton(buttonType: .small, bgColor: Color.Paws.Content.yellow) {
                    Text("Ветклиники")
                        .foregroundColor(Color.Paws.Text.label)
                        .font(.custom("Moloko", size: 36))
                } content: {
                    EmptyView()
                } image: {
                    Image("dogImage4")
                } action: {
                    
                }
            ), AnyView(
                MainModalButton(buttonType: .tiny, bgColor: Color.Paws.Content.pink) {
                    Text("Бешенство")
                        .foregroundColor(Color.Paws.Constant.white)
                        .bold()
                        .font(.custom("Moloko", size: 36))
                } content: {
                    VStack {
                        Text("Подробности")
                        Spacer()
                        Text("Открыть")
                    }
                    .foregroundColor(Color.Paws.Constant.white)
                } action: {
                    
                }
            )])
        
    ]
}
