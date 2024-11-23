//
//  PawsColorSet.swift
//  lapki
//
//  Created by Maxim Makarenkov on 20.11.2024.
//

import Foundation
import SwiftUI

extension Color {
    enum Paws {
        enum Background {
            static let background = Color("Paws/Background/Background")
            static let buttonBackground = Color("Paws/Background/ButtonBackground")
            static let containerOnBackground = Color("Paws/Background/ContainerOnBackground")
            static let elevatedContainerBG = Color("Paws/Background/ElevatedContainerBG")
        }
        
        enum Constant {
            static let black = Color("Paws/Constant/Black")
            static let secondaryBlack = Color("Paws/Constant/SecondaryBlack")
            static let secondaryWhite = Color("Paws/Constant/SecondaryWhite")
            static let uiAccent = Color("Paws/Constant/UIAccent")
            static let white = Color("Paws/Constant/White")
        }
        
        enum Text {
            static let label = Color("Paws/Text/Label")
            static let labelInContainer = Color("Paws/Text/LabelInContainer")
            static let secondaryLabel = Color("Paws/Text/SecondaryLabel")
            static let secondarySubhead = Color("Paws/Text/SecondarySubhead")
        }
        
        enum Shadow {
            static let green = Color("Paws/Shadow/Green")
            static let pink = Color("Paws/Shadow/Pink")
            static let purple = Color("Paws/Shadow/Purple")
            static let yellow = Color("Paws/Shadow/Yellow")
        }
    }
}
