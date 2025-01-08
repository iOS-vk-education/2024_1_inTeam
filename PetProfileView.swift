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
                            .multilineTextAlignment(.center)
                            .padding(EdgeInsets(top: 210, leading: 0, bottom: 0, trailing: 0))
                            .offset(y: -minY)
                        
                    }
                    
                    VStack(alignment: .center){
                            Image("cat_image")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120 + (minY > 0 ? minY : 0))
                                .frame(width: proxy.size.width)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                                .overlay(Circle().stroke(Color.white, lineWidth: 1))
                                .offset(y: -minY)
            
                    }.padding(.top, 100)

                    ZStack{
                        Rectangle()
                            .frame(width: 400, height: 900)
                            .padding(.top, 300)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                        Rectangle()
                            .frame(width: 190,  height: 80)
                            .cornerRadius(15)
                            .padding(EdgeInsets(top: 0, leading: 190, bottom: 500, trailing: 0))
                            .foregroundColor(Color("lightGreen"))
                        Text("Возраст")
                            .font(.title2)
                            .padding(EdgeInsets(top: 0, leading: 120, bottom: 535, trailing: 0))
                        Rectangle()
                            .frame(width: 160, height: 30)
                            .cornerRadius(20)
                            .foregroundColor(Color("darkGreen"))
                            .opacity(2.0)
                            .padding(EdgeInsets(top: 0, leading: 200, bottom: 470, trailing: 0))
                        
                        Text("3 года")
                            .font(.custom("Helvetica Neue", size: 20))
                            .padding(EdgeInsets(top: 0, leading: 200, bottom: 470, trailing: 0))
                        Rectangle()
                            .frame(width: 190,  height: 80)
                            .cornerRadius(15)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 500, trailing: 205))
                            .foregroundColor(Color("lightPink"))
                        Text("Порода")
                            .font(.title2)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 535, trailing: 290))
                        Rectangle()
                            .frame(width: 160, height: 30)
                            .cornerRadius(20)
                            .foregroundColor(Color("darkPink"))
                            .opacity(2.0)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 470, trailing: 210))
                        Text("Бурма")
                            .font(.custom("Helvetica Neue", size: 20))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 470, trailing: 210))
                        Rectangle()
                            .frame(width: 390, height: 220)
                            .cornerRadius(15)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 180, trailing: 7))
                            .foregroundColor(Color("lightYellow"))
                        Text("Личные данные")
                            .font(.title2)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 350, trailing: 190))
                        Rectangle()
                            .frame(width: 380, height: 45)
                            .cornerRadius(15)
                            .padding(.bottom, 260)
                            .padding(.trailing, 10)
                            .foregroundColor(Color("darkYellow"))
                        Text("Пол                                                        Мужской")
                            .padding(.bottom, 260)
                        NavigationLink(destination: PassportImageView()) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 380, height: 45)
                                    .cornerRadius(15)
                                    .padding(.bottom, 155)
                                    .padding(.trailing, 8)
                                    .foregroundColor(Color("darkYellow"))
                                    .shadow(radius: 5)
                                Text("Паспорт                                             RU 004266")
                                    .padding(.bottom, 155)
                                    .foregroundColor(.black)
                            }
                        }
                        NavigationLink(destination: MedCardImageView()) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 380, height: 50)
                                    .cornerRadius(15)
                                    .padding(.bottom, 45)
                                    .padding(.trailing, 7)
                                    .foregroundColor(Color("darkYellow"))
                                    .shadow(radius: 5)
                                
                                Text("Мед.карта")
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 45, trailing: 269))
                                    .foregroundColor(.black)
                                
                                Text("12.02.2024 комплесная        прививка")
                                    .padding(EdgeInsets(top: 0, leading: 155, bottom: 45, trailing: 0))
                                    .foregroundColor(.black)
                            }
                        }
                        Rectangle()
                            .frame(width: 390, height: 330)
                            .cornerRadius(15)
                            .padding(EdgeInsets(top: 390, leading: 0, bottom: 0, trailing: 7))
                            .foregroundColor(Color("lightPurple"))
                        Text("Описание питомца")
                            .font(.title2)
                            .padding(EdgeInsets(top: 110, leading: 0, bottom: 0, trailing: 160))
                       
                        VStack{
                            Text("Барсик — 3-летний кот бирманской породы с кремовой шерстью  и темными пятнами на лапках, ушах и хвосте. Он спокойный и дружелюбный, но немного пугливый при встрече с незнакомыми людьми. Барсик обожает играть с мячиками и лазить по деревьям, а также всегда ищет уютные места для сна, особенно высокие полки и мягкие уголки. Он очень привязан к своему хозяину, Оле, и чувствует себя особенно комфортно рядом с ней.")
                        }
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 6)
                        .background(Color("darkPurple"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.top, 420)
                        .padding(.trailing, 7)
                        
                        
                    }
                }
            }
            .background(Color.Paws.Constant.uiAccent)
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
#Preview {
    PetProfileView()
}

struct EditButton: View {
    var body: some View {
        NavigationLink(destination:
            EditMenuVIew()) {
            Image(systemName: "pencil.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 35, height: 35)
                .shadow(radius: 10)
                .foregroundColor(.white)
        }
    }
}
