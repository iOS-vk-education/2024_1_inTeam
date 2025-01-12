//
//  MapTestView.swift
//  lapki
//
//  Created by Максим Лейхнер on 23.11.2024.
//

import SwiftUI
import BottomSheetSwiftUI
import Swinject

struct MainMapView: View {
    @StateObject var mapManager = YandexMapManager()
    @State var showUserSheet: Bool = false
    @State var bottomSheetPosition: BottomSheetPosition = .relativeTop(0.9)
    @StateObject var viewModel = MainMapViewModel()
    private let authedUser = Container.authedUser
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack {
                Button {
                    withAnimation(.smooth(duration: 0.1)) {
                        showUserSheet.toggle()
                    }
                } label: {
                    if let avatarURL = authedUser.photoName {
                        Image(avatarURL)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color.Paws.Background.background, lineWidth: 3)
                            }
                            .shadow(color: Color.black.opacity(0.1), radius: 12)
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color.Paws.Background.background, lineWidth: 3)
                            }
                            .shadow(color: Color.black.opacity(0.1), radius: 12)
                            .foregroundStyle(Color.Paws.Text.label)
                    }

                }
                .opacity(showUserSheet ? 0 : 1)
                Spacer()
                Text("Лапки")
                    .font(.custom("Moloko", size: 64))
                Spacer()
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 48, height: 48)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .zIndex(1)
            YandexMapView()
                .edgesIgnoringSafeArea(.all)
                .environmentObject(mapManager)
        }
        .bottomSheet(bottomSheetPosition: $bottomSheetPosition, switchablePositions: [.relativeTop(0.9), .relativeBottom(0.2)]) {
            SearchBarView(viewModel: viewModel)
                .padding(.horizontal, 18)
                .padding(.bottom, 18)
        } mainContent: {
            MainModalView(mapViewModel: viewModel)
        }
        .customBackground(
            Color.Paws.Background.background
                .shadow(color: .black.opacity(0.1), radius: 10)
                .clipShape(.rect(
                    topLeadingRadius: 36,
                    topTrailingRadius: 36
                ))
        )
        .sheet(isPresented: $showUserSheet){
            UserView()
        }
        .fullScreenCover(isPresented: $mapManager.showPlaceInfo, content: {
            NavigationStack {
                PlaceView(viewModel: PlaceViewModel(place: mapManager.presentedPlaceInfo!))
                    .navigationTitle(mapManager.presentedPlaceInfo?.type.rawValue ?? "Учреждение")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                mapManager.showPlaceInfo = false
                            } label: {
                                HStack {
                                    Image(systemName: "chevron.left")
                                    Text("Назад")
                                }
                            }
                            .foregroundStyle(Color.Paws.Constant.uiAccent)
                        }
                    }
                    .toolbarBackground(Material.thinMaterial, for: .navigationBar)
            }
        })
        .fullScreenCover(isPresented: $viewModel.showPlaceInfo) {
            NavigationStack {
                PlaceView(viewModel: PlaceViewModel(place: viewModel.placeInfo!))
                    .navigationTitle(mapManager.presentedPlaceInfo?.type.rawValue ?? "Учреждение")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                viewModel.showPlaceInfo = false
                            } label: {
                                HStack {
                                    Image(systemName: "chevron.left")
                                    Text("Назад")
                                }
                            }
                            .foregroundStyle(Color.Paws.Constant.uiAccent)
                        }
                    }
                    .toolbarBackground(Material.thinMaterial, for: .navigationBar)
            }
            
        }
        
    }
}
