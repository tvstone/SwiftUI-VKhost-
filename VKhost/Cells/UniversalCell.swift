//
//  UniversalCell.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.11.2021.
//

import SwiftUI


struct UniversalCell: View {

    var avatar : String
    var nameOrTitle : String
    var additionalInformation : String
    var startColor : UIColor
    var body: some View {

        ZStack {
            Color(startColor)
                .ignoresSafeArea(.all)

            NavigationLink (
                destination: DestinationViewAppInformation(),
                label: {
                    HStack{
                        Image(avatar)
                            .resizable()
                            .avatarViewMod()
                        Spacer()
                        VStack {
                            Text(nameOrTitle)
                                .titleViewMod()
                            Text(additionalInformation)
                                .additionalViewMod()
                        }
                    }
                    .offset(x: 10, y: 0)
                }
            )
        }
    }
}

struct UniversalCell_Previews: PreviewProvider {
    static var previews: some View {
        UniversalCell(avatar: "bred", nameOrTitle: "Наименование группы или имя друга", additionalInformation: "Доп информация", startColor: .gray)
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
            .shadow(color: .white.opacity(0.5), radius: 10, x: 5, y: 5)
    }
}

struct addInformation : ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .padding(.leading)
            .offset(x: -85, y: 0)
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


struct DestinationViewAppInformation: View {

    private var colorAdditionalInformation = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)

    var body: some View {
        ZStack {
            Color(colorAdditionalInformation)
                .ignoresSafeArea(.all)
            Text("Информация")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold, design: .serif))

        }


    }
}
