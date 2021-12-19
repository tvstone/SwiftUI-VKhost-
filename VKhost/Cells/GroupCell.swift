//
//  GroupCell.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 04.12.2021.
//
import SwiftUI
import Kingfisher

struct GroupCell: View {
    
    @State var avatar : String
    @State var name : String
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
                Spacer()
                VStack(alignment: .leading) {
                    Text(name)
                        .titleMod()
                }
            }
            .offset(x: 10, y: 0)
        }
    }
}

struct FullName : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 200,  maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 18, weight: .semibold, design: .serif))
            .foregroundColor(.white)
            .padding(.leading, 10)
            .padding(.trailing, 14)
            .shadow(color: .white.opacity(0.5), radius: 10, x: 5, y: 5)
    }
}

struct AvatarView : ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: 70 , height: 70, alignment: .center )
            .clipShape(Circle())
            .shadow(color: .white.opacity(0.5), radius: 5, x: 2, y: 2)
    }
}


extension View {
    func titleMod () -> some View {
        return self.modifier(FullName())
    }
    func avatarMod () -> some View {
        return self.modifier(AvatarView())
    }
}

struct GroupCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupCell(avatar: "21", name: "Group name hfhfhhf fhfhfhff ffjfjfjffj")
    }
}


