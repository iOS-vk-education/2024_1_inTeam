//
//  PlaceView.swift
//  lapki
//
//  Created by Савелий Коцур on 19.11.2024.
//

import SwiftUI

struct PlaceView: View {
    var place: any Place
    @State var selectedPhoto = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text(place.name)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .font(.system(size: 24, weight: .heavy, design: .rounded))
                
                HStack {
                    Text("Ветеринарное учреждение") //place.type (нужно что-то сделать с тайпом для вывода имени тайпа)
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(.black)
                    Spacer()
                    Menu { //не хватает часов работы
                        Text("Часы работы: 8:00 - 22:00")
                    } label: {
                        Text("Открыто до 22:00")
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                            .padding(.leading, -5)
                    }
                    
                }
                .padding(.horizontal)
                
                // Image Carousel
                TabView(selection: $selectedPhoto) {
                    ForEach(place.photosId, id: \.self) { photoName in
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
                            .foregroundColor(.black)
                        VStack (alignment: .leading) {
                            Text("Адрес")
                                .fontWeight(.medium)
                                .padding(.bottom, 2)
                            Text(place.address)
                        }
                    }
                    .padding(.bottom, 8)
                    HStack(alignment: .top) {
                        Image(systemName: "phone")
                            .foregroundColor(.black)
                        VStack (alignment: .leading) {
                            Text("Телефон")
                                .fontWeight(.medium)
                                .padding(.bottom, 2)
                            Text("+7 495 432 23 54") //не хватает номера телефона в модели
                        }
                    }
                }
                .font(.subheadline)
                .padding(.horizontal)
                .padding(.bottom)
                
                // Description
                Text("Структурное подразделение СББЖ ЮАО ГБУ «Мосветобъединение». Вакцинация, оформление ветеринарных сопроводительных документов, услуги по лечению животных. Работает центр лучевой диагностики и компьютерной томографии.") //не хватает дескрипшна в модели
                    .font(.body)
                    .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .background(Color(UIColor.systemBackground))
        .safeAreaInset(edge: .bottom) {
            // Footer Buttons
            HStack(spacing: 16) {
                Button(action: {
                    // Route action
                }) {
                    HStack {
                        Text("Маршрут")
                            .foregroundColor(.white)
                        Image(systemName: "point.bottomleft.forward.to.arrowtriangle.uturn.scurvepath")
                            .resizable()
                            .padding(.vertical, 12)
                            .scaledToFit()
                        //                            .frame(width: 47, height: 47)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 47)
                    .padding(.horizontal)
                    .background(Color("Green"))
                    .cornerRadius(9)
                }
                
                Button(action: {
                    // Call action
                }) {
                    Image(systemName: "phone.arrow.up.right")
                        .resizable()
                        .padding(.all, 12)
                        .scaledToFit()
                        .frame(width: 47, height: 47)
                        .background(Color("lightGreen"))
                        .foregroundColor(Color("Green"))
                        .cornerRadius(9)
                }
                Button(action: {
                    // Web action
                }) {
                    Image(systemName: "globe")
                        .resizable()
                        .padding(.all, 12)
                        .scaledToFit()
                        .frame(width: 47, height: 47)
                        .background(Color("lightGreen"))
                        .foregroundColor(Color("Green"))
                        .cornerRadius(9)
                }
                Button(action: {
                    // Add appointment action
                }) {
                    Image(systemName: "calendar.badge.plus")
                        .resizable()
                        .padding(.all, 10)
                        .scaledToFit()
                        .frame(width: 47, height: 47)
                        .background(Color("lightGreen"))
                        .foregroundColor(Color("Green"))
                        .cornerRadius(9)
                }
            }
            .padding()
            .background(Color(UIColor.systemBackground).shadow(radius: 4))
        }
    }
}

#Preview {
    PlaceView(place: WalkingAreaModel.MOCK_WalkingAreaModel)
}
