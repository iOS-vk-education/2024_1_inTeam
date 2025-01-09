//
//  PetProfileView.swift
//  lapki
//
//  Created by 596 on 02.12.2024.
//

import SwiftUI
struct PetProfileView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                GeometryReader {proxy in
                    let minY = proxy.frame(in: .global).minY
                    LazyVStack (alignment: .center){
                        Text("Барсик")
                            .frame(width: 100, height: 100 + (minY > 0 ? minY : 0))
                            .frame(width: proxy.size.width)
                            .font(.title)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 220, leading: 0, bottom: 0, trailing: 0))
                            .offset(y: -minY)
                        
                    }
                    
                    VStack(alignment: .center){
                            Image("cat_image")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140 + (minY > 0 ? minY : 0))
                                .frame(width: proxy.size.width)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                                .offset(y: -minY)
            
                    }.padding(.top, 100)

                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 395, height: 900)
                            .padding(.top, 300)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                        Rectangle()
                            .frame(width: 170,  height: 80)
                            .cornerRadius(15)
                            .padding(EdgeInsets(top: 0, leading: 200, bottom: 480, trailing: 0))
                            .foregroundColor(Color("Green"))
                        
                        Text("Возраст")
                            .font(.title2)
                            .padding(EdgeInsets(top: 0, leading: 130, bottom: 525, trailing: 0))
                            .foregroundColor(.white)
                        Rectangle()
                            .frame(width: 130, height: 30)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .opacity(2.0)
                            .padding(EdgeInsets(top: 0, leading: 200, bottom: 450, trailing: 0))
                        
                        Text("3 года")
                            .font(.custom("Helvetica Neue", size: 20))
                            .padding(EdgeInsets(top: 0, leading: 200, bottom: 450, trailing: 0))
                            .foregroundColor(Color("Black"))
                        Rectangle()
                            .frame(width: 170,  height: 80)
                            .cornerRadius(15)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 480, trailing: 205))
                            .foregroundColor(Color("Green"))
                        Text("Порода")
                            .font(.title2)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 525, trailing: 270))
                            .foregroundColor(.white)
                        Rectangle()
                            .frame(width: 130, height: 30)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .opacity(2.0)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 450, trailing: 210))
                        Text("Бурма")
                            .font(.custom("Helvetica Neue", size: 20))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 450, trailing: 210))
                            .foregroundColor(Color("Black"))
                        Rectangle()
                            .frame(width: 376, height: 220)
                            .cornerRadius(15)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 160, trailing: 3))
                            .foregroundColor(Color("Green"))
                        Text("Личные данные")
                            .font(.title2)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 330, trailing: 190))
                            .foregroundColor(.white)
                        Rectangle()
                            .frame(width: 330, height: 45)
                            .cornerRadius(15)
                            .padding(.bottom, 240)
                            .padding(.trailing, 4)
                            .foregroundColor(.white)
                        HStack(spacing: 150) {
                            Text("Пол :")
                            Text("Мужской")
                                
                        }
                        .font(.custom("Helvetica Neue", size: 20))
                        .padding(.bottom, 240)
                        .foregroundColor(Color("Black"))
                        
                        HStack {
                            NavigationLink(destination: PassportImageView()) {
                                ZStack {
                                    VStack {
                                        Image(systemName: "menucard")
                                            .font(.system(size: 40))
                                            .foregroundColor(Color("Black"))
                                            .padding()
                                            .background(Circle().fill(Color.white))
                                        Text("Паспорт")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.bottom, 70)
                                    .padding(.trailing, 30)
                                }
                            }
                            NavigationLink(destination: MedCardImageView()) {
                                ZStack {
                                    VStack {
                                        Image(systemName: "heart.text.square")
                                            .font(.system(size: 40))
                                            .foregroundColor(Color("Black"))
                                            .padding()
                                            .background(Circle().fill(Color.white))
                                        Text("Мед.Карта")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.bottom, 60)
                                    .padding(.leading, 30)
                                }
                            }
                        }
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 380, height: 350)
                            .padding(EdgeInsets(top: 430, leading: 0, bottom: 0, trailing: 3))
                            .foregroundColor(Color("Green"))
                        Text("Описание питомца")
                            .font(.title2)
                            .padding(EdgeInsets(top: 130, leading: 0, bottom: 0, trailing: 160))
                            .foregroundColor(.white)
                       
                        HStack{
                            Text("""
                                 Барсик — 3-летний кот бирманской породы с кремовой шерстью  и темными пятнами на лапках, ушах и хвосте. Он спокойный и дружелюбный, но немного пугливый при встрече с незнакомыми людьми. Барсик обожает играть с мячиками и лазить по деревьям, а также всегда ищет уютные места для сна, особенно высокие полки и мягкие уголки. Он очень привязан к своему хозяину, Оле, и чувствует себя особенно комфортно рядом с ней.
                                 """)
                            .frame(width: 360)
                            .foregroundColor(Color("Black"))
                            .padding(.vertical,10)
                            .padding(.horizontal, 5)
                        }
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.top, 450)
                        .padding(.trailing, 7)
                    }
                }
            }
            .background(Color("Green"))
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        //
                    }) {
                        Image(systemName: "chevron.left")
                            .frame(width: 100)
                            .foregroundColor(.white)
                            .padding(.leading, -20)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                        .padding(.trailing, 10)
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)

        }
    }
        
}

struct EditButton: View {
    var body: some View {
        NavigationLink(destination:
            EditMenuVIew()) {
            Image(systemName: "pencil.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 35, height: 35)
                .foregroundColor(.white)
        }
    }
}
