//
//  FriendsView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.11.2021.
//

import SwiftUI

struct FriendsView: View {
    private var startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    private var avatar : String = "vlad"
    private var fullNameFriend : String = "Фамилия и имя друга"
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
                    ForEach(0 ..< 25) { item in
                        UniversalCell(avatar: avatar, nameOrTitle: fullNameFriend, additionalInformation: additionalInformation, startColor: startColor)
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("Мои друзья", displayMode: .inline)

        }
    }
}



struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            FriendsView()
                .previewDevice("iPhone SE")
            FriendsView()
                .previewDevice("iPhone 12")
        }
    }
}




