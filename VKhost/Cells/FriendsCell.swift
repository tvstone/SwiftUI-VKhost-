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
    @State var city : String
    var startColor : UIColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    var body: some View {
        ZStack {
            Color(startColor)
                .ignoresSafeArea(.all)
            HStack{
                KFImage(URL(string: avatar))
                    .cancelOnDisappear(true)
                    .resizable()
                    .avatarViewMod()
                Spacer()
                VStack(alignment: .leading) {
                    Text(name)
                        .titleViewMod()
                    Text(city)
                        .additionalViewMod()
                }
            }
            .offset(x: 10, y: 0)
        }
    }
}

struct fullNameView : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 200,  maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 20, weight: .semibold, design: .serif))
            .foregroundColor(.white)
            .padding(.leading, 10)
            .padding(.trailing, 14)
            .shadow(color: .white.opacity(0.5), radius: 10, x: 5, y: 5)
    }
}

struct avatarView : ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: 70 , height: 70, alignment: .center )
            .clipShape(Circle())
            .shadow(color: .white.opacity(0.5), radius: 5, x: 2, y: 2)
    }
}

struct addInformation : ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .padding(.leading)
            .shadow(color: .black.opacity(0.7), radius: 10, x: 0, y: 0)
    }
}

extension View {
    func titleViewMod () -> some View {
        return self.modifier(fullNameView())
    }
    func avatarViewMod () -> some View {
        return self.modifier(avatarView())
    }
    func additionalViewMod ()-> some View {
        return self.modifier(addInformation())
    }
}

struct FriendsCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendsCell(avatar: "21", name: "Name hfhfhhf fhfhfhff ffjfj", city: "Moscow")
    }
}


