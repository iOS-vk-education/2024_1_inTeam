//
//  MapTestView.swift
//  lapki
//
//  Created by Максим Лейхнер on 23.11.2024.
//

import SwiftUI

struct MainMapView: View {
    @ObservedObject var mapManager = YandexMapManager()
    @State var showUserSheet: Bool = false
    @State var showCardTEMPORARY: Bool = true
    @State var showPlaceTEMPORARY: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack {
                Button {
                    withAnimation(.smooth(duration: 0.1)) {
                        showUserSheet.toggle()
                    }
                } label: {
                    Image("sample")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(Color.Paws.Background.background, lineWidth: 3)
                        }
                        .shadow(color: Color.black.opacity(0.1), radius: 12)
                    //.matchedGeometryEffect(id: "userIcon", in: userIconAnimation)
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
        .sheet(isPresented: $showUserSheet){
            UserView()
        }
        .sheet(isPresented: $showCardTEMPORARY) {
            PlaceCardView(place: WalkingAreaModel.MOCK_WalkingAreaModel, onCardTap: {
                showCardTEMPORARY.toggle()
                showPlaceTEMPORARY.toggle()
            })
            .padding(20)
            .presentationDetents([.height(300)])
            .presentationBackgroundInteraction(.enabled)
            .presentationBackground(Color.Paws.Background.background)
//            .interactiveDismissDisabled()
            .presentationCornerRadius(48)
        }
        .sheet(isPresented: $showPlaceTEMPORARY, onDismiss: {
            showCardTEMPORARY.toggle()
        }) {
            PlaceView(place: WalkingAreaModel.MOCK_WalkingAreaModel)
        }
    }
}
