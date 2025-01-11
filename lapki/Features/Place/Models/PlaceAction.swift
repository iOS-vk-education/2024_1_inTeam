//
//  PlaceAction.swift
//  lapki
//
//  Created by Maxim Makarenkov on 11.01.2025.
//

class PlaceAction {
    let iconName: String
    let action: (Place) -> Void
    
    init(iconName: String, action: @escaping (Place) -> Void) {
        self.iconName = iconName
        self.action = action
    }
    
    func invoke(place: Place) {
        action(place)
    }
    
}
