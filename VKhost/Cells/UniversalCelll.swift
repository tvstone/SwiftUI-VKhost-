//
//  UniversalCell.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.11.2021.
//

//import SwiftUI
//
//struct UniversalCell: View {
//
//    @Binding var avatar : String
//    @Binding var nameOrTitle : String
//    private let startColor = #colorLiteral(red: 0, green: 0.5416892767, blue: 0.9964188933, alpha: 1)
//
//    var body: some View {
//
//        ZStack {
//            Color(startColor)
//                .ignoresSafeArea(.all)
//            VStack {
//
//                HStack{
//                    Image(avatar)
//                        .resizable()
//                        .avatarViewMod()
//
//                    Spacer()
//
//                    Text(nameOrTitle)
//                        .fullNameViewMod()
//                }
//                .offset(x: 10, y: 0)
//                Spacer()
//            }
//        }
//    }
//}
//
//
//struct UniversalCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UniversalCell(avatar: .constant("vlad"), nameOrTitle: .constant("Фамилия друга"))
//    }
//}

//
//struct fullNameView : ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .frame(minWidth: 200,  maxWidth: .infinity, alignment: .leading)
//            .font(.system(size: 20, weight: .semibold, design: .serif))
//            .foregroundColor(.white)
//            .padding(.leading, 10)
//            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
//    }
//}
//
//struct avatarView : ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 70 , height: 70, alignment: .center )
//            .clipShape(Circle())
//            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
//    }
//}
//
//extension View {
//    func fullNameViewMod () -> some View {
//        return self.modifier(fullNameView())
//    }
//    func avatarViewMod () -> some View {
//        return self.modifier(avatarView())
//    }
//}
