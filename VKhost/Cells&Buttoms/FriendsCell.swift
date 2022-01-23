//
//  UniversalCell.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.11.2021.
//
import SwiftUI
import Kingfisher

struct FriendsCell: View {
    
    @State var avatar : String
    @State var name : String
    @State var  city : String
    
    var startColor : UIColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    var body: some View {
        ZStack {
            Color(startColor)
                .ignoresSafeArea(.all)
            HStack{
                KFImage(URL(string: avatar))
                    .cancelOnDisappear(true)
                    .resizable()
                    .avatarMod()
                    .avaAnimation()
                Spacer()
                VStack(alignment: .leading) {
                    Text(name)
                        .titleMod()
                    Text(city)
                        .additionalViewMod()
                }
            }
            .offset(x: 10, y: 0)
        }
    }
}

