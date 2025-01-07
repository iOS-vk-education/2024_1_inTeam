//
//  UserSheet.swift
//  lapki
//
//  Created by Maxim Makarenkov on 05.11.2024.
//

import SwiftUI

struct UserView: View {
    @State private var detent: PresentationDetent = .medium
    @State private var showAppointments: Bool = false
    @State private var showSettings: Bool = false
    @State private var showNotifications: Bool = false
    @State private var showProfile: Bool = false
    @GestureState var isDragging: Bool = false
    
    let petListViewModel = UserPetListViewModel()
    
    var body: some View {
        VStack {
            UserHeaderView(showUserProfileView: $showProfile)
                .padding(20)
                .allowsHitTesting(!isDragging)
            
            ScrollView {
                UserButtonGroupView(showAppointments: $showAppointments, showSettings: $showSettings, showNotifications: $showNotifications)
                    .padding(.vertical, 18)
                    .padding(.horizontal, 24)
                    .allowsHitTesting(!isDragging)
                
                PetListView(viewModel: petListViewModel)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 20)
                    .allowsHitTesting(!isDragging)
            }
            .scrollIndicators(.hidden)
        }
        .presentationCornerRadius(48)
        .presentationBackground(Color.Paws.Background.background)
        .presentationDragIndicator(.hidden)
        .presentationDetents([.medium, .height(700)],
                             selection: $detent)
        .sheet(isPresented: $showNotifications) {
            NotificationsView()
        }
        // TODO: Could change to fullScreenCover(item, content)
        .fullScreenCover(isPresented: $showAppointments, content: { AppointmentsView() })
        .fullScreenCover(isPresented: $showSettings, content: { SettingsView() })
        .fullScreenCover(isPresented: $showProfile, content: { UserProfileView() })

        .gesture(
            DragGesture(minimumDistance: 0)
                .updating($isDragging) { _, state, _ in
                    state = true
                }
        )
    }
}
