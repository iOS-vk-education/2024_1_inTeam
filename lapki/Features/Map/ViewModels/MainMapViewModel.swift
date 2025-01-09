//
//  MainMapViewModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 09.01.2025.
//

import Foundation
import Combine

class MainMapViewModel: ObservableObject {
    @Published var recentNotification: Notification?
    private let notificationService = InAppService.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        notificationService.$activeNotification
            .receive(on: DispatchQueue.main)
            .assign(to: \.recentNotification, on: self)
            .store(in: &cancellables)
    }
    
    func dismiss() {
        notificationService.clear()
    }
}
