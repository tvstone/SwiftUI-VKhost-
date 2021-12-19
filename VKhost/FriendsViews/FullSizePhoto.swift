//
//  FullSizePhoto.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 16.12.2021.
//
import SwiftUI
import Kingfisher

struct FullSizePhoto: View {
    
    var url : String
    private let startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    
    var body: some View {
        
        ZStack {
            Color(startColor)
                .ignoresSafeArea()
            KFImage(URL(string: url))
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .cornerRadius(10)
                .shadow(color: .white, radius: 2)
        }
    }
}
