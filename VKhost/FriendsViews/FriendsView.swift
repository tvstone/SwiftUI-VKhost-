//
//  FriendsView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.11.2021.
//

import SwiftUI

struct FriendsView: View {

    private var friends : [Friend] {
        let loadFriends = LoadFriends().myFriends()
        return loadFriends
    }
    var startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    @State var avatar : String = "vlad"
    @State var fullNameFriend : String = "Фамилия и имя друга "
    @State var additionalInformation : String = "Доп информация"

    var body: some View {

        NavigationView() {
            ZStack {
                Color(self.startColor)
                    .ignoresSafeArea(.all)
                ScrollView {
                    ForEach(friends) { friend in

                        NavigationLink(destination: FriendPhotoView(friend: friend))  {
                            FriendsCell(avatar: friend.avaFriend , name: friend.name, additionalInformation: friend.additionalInfo)
                        }
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




