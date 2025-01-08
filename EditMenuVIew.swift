//
//  EditMenuVIew.swift
//  lapki
//
//  Created by 596 on 12.12.2024.
//

import SwiftUI
import UIKit
import PhotosUI

struct EditMenuVIew: View {
    @State private var name: String = "Барсик"
    @State private var breed: String = "Бурма"
    @State private var gender: String = "Мужской"
    @State private var description: String = "Барсик — 3-летний кот бирманской породы с кремовой шерстью  и темными пятнами на лапках, ушах и хвосте. Он спокойный и дружелюбный, но немного пугливый при встрече с незнакомыми людьми. Барсик обожает играть с мячиками и лазить по деревьям, а также всегда ищет уютные места для сна, особенно высокие полки и мягкие уголки. Он очень привязан к своему хозяину, Оле, и чувствует себя особенно комфортно рядом с ней."
    @State private var birthdate: Date = Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 5)) ?? Date()
    @State private var showActionSheet: Bool = false
    @State private var showPhotoPicker: Bool = false
    @State private var showPhotoViewer: Bool = false
    @State private var navigateToMedCard: Bool = false
    @State private var selectedOption: String = ""
    @State private var capturedImage: UIImage?
    @State private var selectedImage: [UIImage] = []
    @State private var isLoading =  false
    @State private var showSuccesMessage = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //NavigationStack{
            VStack {
                VStack {
                    if let image = capturedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                    } else {
                        Image("cat_image")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                            .onTapGesture {
                                showActionSheet = true
                            }
                    }
                }
                .padding()
                .actionSheet(isPresented: $showActionSheet){
                    ActionSheet (
                        title: Text("Действие с фото"),
                        buttons: [
                            .default(Text("Выбрать из галереи")) {
                                showPhotoPicker = true
                                
                            },
                            .default(Text("Посмотреть фото")) {
                                showPhotoViewer = true
                            },
                            .cancel()
                        ]
                    )
                }
                .sheet(isPresented: $showPhotoPicker) {
                    PhotoPickerView(image: $capturedImage)
                }
                .sheet(isPresented: $showPhotoViewer) {
                    PhotoViewerView(image: capturedImage ?? UIImage(named: "cat_image")!)
                }
                
                
                
                Form {
                
                    HStack(alignment: .center) {
                        Section(header: Text("Имя:      ")) {
                            TextField("Имя", text: $name)
                                .padding()
                                .frame(width: 220, height: 50, alignment: .trailing)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.Paws.Constant.uiAccent, lineWidth: 2)
                                )
                                .padding(.horizontal)
                                .padding(.trailing, -50)
                        }
                    }
                    
                    HStack (alignment: .center){
                        Section(header: Text("Порода:")) {
                            TextField("Введите породу", text: $breed)
                                .padding()
                                .frame(width: 220, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.Paws.Constant.uiAccent, lineWidth: 2)
                                )
                                .padding(.horizontal)
                                .padding(.trailing, -50)
                            
                        }
                    }
                    
                    HStack(alignment: .center) {
                        Section(header: Text("Пол:       ")) {
                            Picker("", selection: $gender) {
                                Text("Мужской").tag("Мужской")
                                Text("Женский").tag("Женский")
                                    
                            }
                            .pickerStyle(MenuPickerStyle())
                            .accentColor(.black)
                            .padding(.trailing, 110)
                            .frame(width: 220, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green, lineWidth: 2)
                            )
                            .padding(.horizontal)
                            .padding(.trailing, -50)
                        }
                    }
                    
                    HStack (spacing: 90){
                        Menu {
                            Button(action: {
                                showPhotoPicker = true
                            }) {
                                Text("Изменить фото")
                                Image(systemName: "star")
                            }
                            .sheet(isPresented: $showPhotoPicker) {
                                PhotoPickerView(image: $capturedImage)
                            }

                            NavigationLink(destination: MedCardImageView()) {
                                Text("Посмотреть фото")
                                Image(systemName: "photo")
                            }
                        } label: {
                            VStack {
                                Image(systemName: "heart.text.square")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                Text("Мед.Карта")
                                    .font(.title3)
                            }
                        }
                        .foregroundColor(Color.Paws.Constant.uiAccent)

                        
                        Menu {
                            Button(action: {
                                showPhotoPicker = true
                            }) {
                                Text("Изменить фото")
                                Image(systemName: "star")
                            }
                            .sheet(isPresented: $showPhotoPicker) {
                                PhotoPickerView(image: $capturedImage)
                            }

                            NavigationLink(destination: PassportImageView()) {
                                Text("Посмотреть фото")
                                Image(systemName: "photo")
                            }
                        } label: {
                            VStack{
                                Image(systemName: "menucard.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                Text("Паспорт")
                                    .font(.title3)
                            }
                        }
                        .foregroundColor(Color.Paws.Constant.uiAccent)
                    }
                    .padding(.leading, 30)
                    
                    HStack {
                        Section(header: Text("Дата рождения:        ")) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.Paws.Constant.uiAccent, lineWidth: 2)
                                    .frame(height: 50)
                                DatePicker("", selection: $birthdate, displayedComponents: .date)
                                    .labelsHidden()
                                    .padding(.horizontal)
                            }
                            .frame(height: 50)
                        }
                    }
                    .padding(.horizontal)

                    VStack (alignment:.leading){
                        Section(header: Text("Описание:")) {
                            Spacer()
                            TextEditor(text: $description)
                                .frame(maxWidth: .infinity)
                                .frame(height: 300)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.Paws.Constant.uiAccent, lineWidth: 2)
                                )
                        }
                    }
                }
                .formStyle(.grouped)
                .scrollContentBackground(.hidden)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.Paws.Constant.uiAccent)
                            Text("Назад")
                                .foregroundColor(.Paws.Constant.uiAccent)
                        }
                    }
                    ToolbarItem(placement: .bottomBar){
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .padding()
                        } else {
                            Button(action: {
                                saveData()
                                print("Сохранено!")
                            }) {
                                Text("Сохранить изменения")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.Paws.Constant.uiAccent)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                        }
                        if showSuccesMessage {
                            Text("Сохрание прошла успешно")
                                .foregroundColor(.green)
                                .font(.caption)
                                .transition(.move(edge: .top).combined(with: .opacity))
                                .padding(.top, 5)
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .toolbarBackground(.hidden, for: .bottomBar)
            }
        //}
        .navigationBarTitle("Редактирование", displayMode: .inline)
         .navigationBarTitleDisplayMode(.inline)
        .animation(.easeInOut, value: showSuccesMessage)
    }
    private func saveData() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            isLoading = false
            showSuccesMessage = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showSuccesMessage = false
            }
        }
    }
}

                
#Preview {
    EditMenuVIew()
}
