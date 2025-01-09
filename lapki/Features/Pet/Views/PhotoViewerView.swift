//
//  PhotoViewerView.swift
//  lapki
//
//  Created by 596 on 14.12.2024.
//

import SwiftUI
import UIKit

struct PhotoViewerView: View {
    var image: UIImage

    var body: some View {
        VStack {
            Spacer()
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            Spacer()
        }
        //.ignoresSafeArea()
        .navigationBarTitle("Просмотр фото", displayMode: .inline)
       // .navigationBarItems(trailing: Button("Закрыть") {
            // Закрытие через свайп вниз на iOS
        //})
    }
        
}
