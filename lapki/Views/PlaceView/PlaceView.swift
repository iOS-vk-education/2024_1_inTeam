//
//  PlaceView.swift
//  lapki
//
//  Created by Савелий Коцур on 19.11.2024.
//

import SwiftUI

struct PlaceView: View {
    var place: any Place
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text(place.name)
                    .font(Font.custom("SF Pro Rounded", size: 24))
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                
                HStack {
                    Text("Ветеринарное учреждение") //place.type (нужно что-то сделать с тайпом для вывода имени тайпа)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Menu { //не хватает часов работы
                        Text("Часы работы: 8:00 - 22:00")
                    } label: {
                        Text("Открыто до 22:00")
                            .font(.subheadline)
                            .foregroundColor(.green)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.green)
                            .padding(.leading, -5)
                    }

                }
                .padding(.horizontal)
                
                // Image Carousel
                TabView {
                    ForEach(place.photosId, id: \.self) { photoName in
                        Image(photoName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 220)
                
                // Address and Phone
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .top) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.black)
                        VStack (alignment: .leading) {
                            Text("Адрес")
                            Text(place.address)
                        }
                    }
                    HStack(alignment: .top) {
                        Image(systemName: "phone")
                            .foregroundColor(.black)
                        VStack (alignment: .leading) {
                            Text("Телефон")
                            Text("+7 495 432 23 54") //не хватает номера в модели
                        }
                    }
                }
                .font(.subheadline)
                .padding(.horizontal)
                
                // Description
                Text("Структурное подразделение СББЖ ЮАО ГБУ «Мосветобъединение». Вакцинация, оформление ветеринарных сопроводительных документов, услуги по лечению животных. Работает центр лучевой диагностики и компьютерной томографии") //не хватает дескрипшна в модели
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
                    Text("Маршрут")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {
                    // Call action
                }) {
                    Image(systemName: "phone.fill")
                        .frame(width: 48, height: 48)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(24)
                }
                Button(action: {
                    // Web action
                }) {
                    Image(systemName: "globe")
                        .frame(width: 48, height: 48)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {
                    // Additional action
                }) {
                    Image(systemName: "plus")
                        .frame(width: 48, height: 48)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(24)
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
