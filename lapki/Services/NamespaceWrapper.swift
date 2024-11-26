//
//  NamespaceWrapper.swift
//  lapki
//
//  Created by Maxim Makarenkov on 26.11.2024.
//

import Foundation
import SwiftUI

class NamespaceWrapper: ObservableObject {
    var namespace: Namespace.ID
    
    init(_  namespace: Namespace.ID) {
        self.namespace = namespace
    }
}
