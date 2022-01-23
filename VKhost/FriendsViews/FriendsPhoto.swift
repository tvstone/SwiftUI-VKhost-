//
//  FriendsPhoto.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.12.2021.
//


import SwiftUI
import Kingfisher

struct FriendsPhoto: View {
    
    @StateObject var viewModelFriendsPhoto = FriendPhotoViewModel()
    var friend : Item
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let animationDuration = 0.1
    
    var body: some View {
        
        ZStack {
            Color(#colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1))
                .ignoresSafeArea()
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 10) {
                        ForEach(viewModelFriendsPhoto.photos) { photo in
                            NavigationLink(destination: FullSizePhoto(url: photo.sizes.last?.url ?? "") ) {
                                LazyVStack(alignment: .center, spacing: 8){
                                    KFImage(URL(string: photo.sizes.last?.url ?? ""))
                                        .cancelOnDisappear(true)
                                        .resizable()
                                        .newsViewMod()
                                    LikeButtonBar(friend: friend, photo: photo)
                                        .environmentObject(viewModelFriendsPhoto)
                                }
                            }
                        }
                    }
            }
            .onAppear {
                self.viewModelFriendsPhoto.getFriendPhoto(friend: self.friend)
            }
        }
        .environmentObject(viewModelFriendsPhoto)
    }
}
