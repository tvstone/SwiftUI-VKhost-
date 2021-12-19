//
//  FriendsView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.11.2021.
//

import SwiftUI

struct FriendsView: View {
    
    @ObservedObject var viewModelFriends = FriendsViewModel()
    
    var body: some View {
        
        NavigationView() {
            ZStack {
                Color(#colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1))
                    .ignoresSafeArea(.all)
                ScrollView {
                    ForEach(viewModelFriends.friends) { friend in
                        NavigationLink(destination: FriendPhotoView(friend: friend)) {
                            let name = friend.firstName  + " " + friend.lastName
                            FriendsCell(avatar: friend.avatar, name: name, city: friend.city?.title ?? "" )
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("Мои друзья", displayMode: .inline)
        }
    }
}



