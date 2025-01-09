//
//  PlaceIconBuilder.swift
//  lapki
//
//  Created by Maxim Makarenkov on 07.01.2025.
//

import SwiftUI

struct PlaceIconBuilder: View {
    var placeType: PlaceType
    
    @ViewBuilder
    var body: some View {
        switch placeType {
        case .clinic:
            Image(systemName: "cross.fill")
                .resizable()
                .scaledToFit()
                .padding(11)
                .background(Color.Paws.Content.purple)
                .clipShape(Circle())
                .frame(width: 48, height: 48)
        case .walkingArea:
            Image(systemName: "baseball.fill")
                .resizable()
                .scaledToFit()
                .padding(11)
                .background(Color.Paws.Content.yellow)
                .clipShape(Circle())
                .frame(width: 48, height: 48)
        case .vaccination:
            Image(systemName: "syringe.fill")
                .resizable()
                .scaledToFit()
                .padding(11)
                .background(Color.Paws.Content.green)
                .clipShape(Circle())
                .frame(width: 48, height: 48)
        case .shelter:
            Image(systemName: "house.fill")
                .resizable()
                .scaledToFit()
                .padding(11)
                .background(Color.Paws.Content.pink)
                .clipShape(Circle())
                .frame(width: 48, height: 48)
        }
    }
}

