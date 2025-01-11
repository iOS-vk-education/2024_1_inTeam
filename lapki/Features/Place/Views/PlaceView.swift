//
//  PlaceView.swift
//  lapki
//
//  Created by Савелий Коцур on 19.11.2024.
//

import SwiftUI
import Swinject

struct PlaceView: View {
    @ObservedObject var viewModel: PlaceViewModel
    @State var selectedPhoto = 0
    @State var isAddingSpend = false
    private let placeRepository = Container.placeRepository
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text(viewModel.place.name)
                    .padding(.horizontal)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                
                HStack {
                    Text(viewModel.place.type.rawValue)
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(Color.Paws.Text.label)
                    Spacer()
                    Menu { //TODO: не хватает часов работы
                        Text("Часы работы: 8:00 - 22:00")
                            .foregroundColor(Color.Paws.Text.label)
                    } label: {
                        Text("Открыто до 22:00")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(Color.Paws.Text.label)
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.Paws.Text.label)
                            .padding(.leading, -5)
                    }
                    
                }
                .padding(.horizontal)
                
                //TODO: Переделать Image Carousel на Pager
                TabView(selection: $selectedPhoto) {
                    ForEach(viewModel.place.photosId, id: \.self) { photoName in
                        Image(photoName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 273)
                            .clipped()
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 273)
                
                // Address and Phone
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .top) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(Color.Paws.Text.label)
                        VStack (alignment: .leading) {
                            Text("Адрес")
                                .fontWeight(.medium)
                                .padding(.bottom, 2)
                            Text(viewModel.place.address)
                        }
                    }
                    .padding(.bottom, 8)
                    
                    if viewModel.place.type == .clinic {
                        HStack(alignment: .top) {
                            Image(systemName: "phone")
                                .foregroundColor(Color.Paws.Text.label)
                            VStack (alignment: .leading) {
                                Text("Телефон")
                                    .fontWeight(.medium)
                                    .padding(.bottom, 2)
                                let clinic = viewModel.place as! ClinicModel
                                Text(clinic.phoneNumber)
                            }
                        }
                    }
                    
                    
                }
                .font(.subheadline)
                .padding(.horizontal)
                .padding(.bottom)
                
                // Description
                Text(viewModel.place.description)
                    .font(.body)
                    .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .background(Color.Paws.Background.background)
        .safeAreaInset(edge: .bottom) {
            // Footer Buttons
            VStack {
                HStack(spacing: 16) {
                    Button(action: {
                        //TODO: Route action
                    }) {
                        HStack {
                            Text("Маршрут")
                                .foregroundColor(.white)
                            Image(systemName: "point.bottomleft.forward.to.arrowtriangle.uturn.scurvepath")
                                .resizable()
                                .padding(.vertical, 12)
                                .scaledToFit()
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 47)
                        .padding(.horizontal)
                        .background(Color.Paws.Constant.uiAccent)
                        .cornerRadius(9)
                    }
                    
                    Button(action: {
                        //TODO: Call action
                    }) {
                        Image(systemName: "phone.arrow.up.right")
                            .resizable()
                            .padding(.all, 12)
                            .scaledToFit()
                            .frame(width: 47, height: 47)
                            .background(Color.Paws.Background.buttonBackground)
                            .foregroundColor(Color.Paws.Constant.uiAccent)
                            .cornerRadius(9)
                    }
                    Button(action: {
                        //TODO: Web action
                    }) {
                        Image(systemName: "globe")
                            .resizable()
                            .padding(.all, 12)
                            .scaledToFit()
                            .frame(width: 47, height: 47)
                            .background(Color.Paws.Background.buttonBackground)
                            .foregroundColor(Color.Paws.Constant.uiAccent)
                            .cornerRadius(9)
                    }
                    Button(action: {
                        isAddingSpend.toggle()
                    }) {
                        Image(systemName: "calendar.badge.plus")
                            .resizable()
                            .padding(.all, 10)
                            .scaledToFit()
                            .frame(width: 47, height: 47)
                            .background(Color.Paws.Background.buttonBackground)
                            .foregroundColor(Color.Paws.Constant.uiAccent)
                            .cornerRadius(9)
                    }
                    .sheet(isPresented: $isAddingSpend, content: {
                        PlaceAddAppointmentView(viewModel: viewModel, addAppendAction: {
                            viewModel.addAppointment()
                            print(viewModel.date)
                            isAddingSpend.toggle()
                        })
                        .presentationDetents([.height(UIScreen.main.bounds.height / 1.4)])
                        .presentationCornerRadius(48)
                    })
                }
                .padding()
            }
            .background {
                Rectangle()
                    .fill(Color.Paws.Background.background)
                    .cornerRadius(24)
                    .shadow(radius: 4)
                    .ignoresSafeArea()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.place.isFavourite.toggle()
                        placeRepository.update(place: viewModel.place)
                    } label: {
                        if viewModel.place.isFavourite {
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                        } else {
                            Image(systemName: "heart")
                                .foregroundStyle(Color.Paws.Text.label)
                        }
                    }
                }
            }
        }
        .toolbarBackground(Color.Paws.Background.background, for: .navigationBar)
    }
}
