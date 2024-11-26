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
                        .frame(width: 48, height: 48)
                        .scaledToFill()
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
    }
}

#Preview {
    MainMapView()
}
