//
//  MainModalButtonLarge.swift
//  modalViewLapki
//
//  Created by Maxim Makarenkov on 03.12.2024.
//

import SwiftUI

enum ButtonType {
    case large
    case small
    case tiny
}

enum ButtonDirection {
    case normal
    case reversed
}

struct MainModalButton<ContentView: View>: View {
    let buttonType: ButtonType
    var direction: ButtonDirection = .normal
    let bgColor: Color
    let title: () -> Text
    @ViewBuilder var content: () -> ContentView
    var image: (() -> Image)? = nil
    let action: () -> Void
    
    @ViewBuilder
    var body: some View {
        switch buttonType {
        case .large:
            Button {
                action()
            } label: {
                switch direction {
                case .normal:
                    GeometryReader { geometry in
                        HStack(spacing: 5) {
                            VStack(alignment: .leading) {
                                title()
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                                    .minimumScaleFactor(0.7)
                                Spacer()
                                content()
                            }
                            .frame(width: geometry.size.width * 3/6, alignment: .topLeading)
                            .padding(.vertical, 18)
                            
                            if let image {
                                image()
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.top, 5)
                                    .frame(width: geometry.size.width * 3/6 - 5, height: geometry.size.height, alignment: .bottomTrailing)
                            }
                        }
                    }
                    .padding(image != nil ? .leading: .horizontal, 18)
                    .frame(maxWidth: 360, maxHeight: 170)
                    .background(bgColor)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    
                case .reversed:
                    GeometryReader { geometry in
                        HStack(spacing: 5) {
                            if let image {
                                image()
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.top, 5)
                                //.padding(.leading, 5)
                                    .frame(width: geometry.size.width * 3/6 - 5, height: geometry.size.height, alignment: .bottomLeading)
                            }
                            
                            VStack(alignment: .trailing) {
                                title()
                                    .lineLimit(2)
                                    .multilineTextAlignment(.trailing)
                                    .minimumScaleFactor(0.7)
                                Spacer()
                                content()
                            }
                            .frame(width: geometry.size.width * 3/6, alignment: .topTrailing)
                            .padding(.vertical, 18)
                        }
                    }
                    .padding(image != nil ? .trailing: .horizontal, 18)
                    .frame(maxWidth: 360, maxHeight: 170)
                    .background(bgColor)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                }
                
            }
        case .small:
            Button {
                action()
            } label: {
                switch direction {
                case .normal:
                    GeometryReader { geometry in
                        VStack(spacing: 0) {
                            VStack(alignment: .center) {
                                title()
                                    .lineLimit(1)
                                    .multilineTextAlignment(.leading)
                                    .minimumScaleFactor(0.7)
                                content()
                            }
                            .padding(.horizontal, 10)
                            
                            if let image {
                                image()
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.top, 5)
                                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                            }
                        }
                    }
                    
                    .padding(.top, 10)
                    .frame(maxWidth: 206, maxHeight: 170)
                    .background(bgColor)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                case .reversed:
                    GeometryReader { geometry in
                        VStack(spacing: 0) {
                            VStack(alignment: .leading) {
                                title()
                                    .lineLimit(1)
                                    .multilineTextAlignment(.leading)
                                    .minimumScaleFactor(0.7)
                                content()
                            }
                            .padding(.horizontal, 10)
                            
                            if let image {
                                image()
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.top, 5)
                                    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                            }
                        }
                    }
                    .padding(.top, 10)
                    .frame(maxWidth: 209, maxHeight: 170)
                    .background(bgColor)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                }
            }
        case .tiny:
            Button {
                action()
            } label: {
                switch direction {
                case .normal:
                    VStack {
                        VStack {
                            title()
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                        Spacer()
                        content()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 18)
                    .frame(maxWidth: 143, maxHeight: 170)
                    .background(bgColor)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    
                case .reversed:
                    GeometryReader { geometry in
                        VStack(spacing: 0) {
                            VStack(alignment: .center) {
                                title()
                                    .lineLimit(1)
                                    .multilineTextAlignment(.leading)
                                    .minimumScaleFactor(0.5)
                                Spacer()
                                content()
                            }
                            .padding(.horizontal, 10)
                            
                            if let image {
                                image()
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.top, 5)
                                    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                            }
                        }
                    }
                    .padding(.top, 10)
                    .frame(maxWidth: 140, maxHeight: 170)
                    .background(bgColor)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                }
            }
        }
    }
}
