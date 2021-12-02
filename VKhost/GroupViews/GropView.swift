//
//  GropView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.11.2021.
//

import SwiftUI

struct GropView: View {

    private var startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)   //UIColor(.indigo)
    private var avatar : String = "bred"
    private var fullNameFriend : String = "Название группы "
    private var additionalInformation : String = "Доп информация"

    init (){
        UINavigationBar.appearance()
            .titleTextAttributes = [.font :
                                        UIFont(name: "Georgia-Bold",size: 24) ?? .boldSystemFont(ofSize: 24),
                                    .foregroundColor : UIColor(.white)]
        UINavigationBar.appearance().barTintColor = startColor
    }

    var body: some View {
        NavigationView() {
        ZStack {
            Color(startColor)
                .ignoresSafeArea(.all)
            ScrollView() {
//                TitleGroup {
//                    Text("Группы")
//                }
                ForEach(0 ..< 25) { item in
                    UniversalCell(avatar: avatar, nameOrTitle: fullNameFriend, additionalInformation: additionalInformation, startColor: startColor)
                }
                Spacer()
            }
        }
        .navigationBarTitle("Мои группы", displayMode: .inline)
        }
    }
}


struct GropView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            GropView()
                .previewDevice("iPhone SE")
            GropView()
                .previewDevice("iPhone 12")
        }
    }
}



