//
//  MainMapViewModel.swift
//  lapki
//
//  Created by Maxim Makarenkov on 09.01.2025.
//

import Foundation
import Combine
import Swinject

class MainMapViewModel: ObservableObject {
    @Published var recentNotification: Notification?
    private let notificationService = InAppService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var results: [Place] = []
    @Published var showPlaceInfo: Bool = false
    @Published var placeInfo: Place? = nil
    @Published var searchFieldActive: Bool = false
    let repository = Container.placeRepository
    
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
