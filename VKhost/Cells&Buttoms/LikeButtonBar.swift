//
//  LikeButtonBar.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.12.2021.
//

import SwiftUI

struct LikeButtonBar: View {
    
    var friend : Item
    var photo : Photo
    @ObservedObject var viewModelLikes = LikesViewModel()
    @ObservedObject var viewModelDeleleLike = DeleteLikeViewModel()
    @State private var animated = false    
    @EnvironmentObject var viewModelFriendsPhoto : FriendPhotoViewModel
    
    var body: some View {
        
        LazyHStack(alignment: .center, spacing: 6) {
            Button {
                self.viewModelFriendsPhoto.likes.forEach { (key , value) in
                    if key == photo.id,
                       value == 0
                    {
                        self.viewModelLikes.setLikeOnPhoto(friend: friend, photo: photo)
                        animatedHeart()
                    }
                    if key == photo.id,
                       value != 0
                    {
                        self.viewModelDeleleLike.deleteLikeOnPhoto(friend: friend, photo: photo)
                        animatedHeart()
                    }
                }
                
            } label: {
                Image(systemName: isHeart(likes: self.viewModelFriendsPhoto.likes, photo: photo))
                    .resizable()
                    .scaledToFit()
            }
            .scaleEffect(animated ? 1.3 : 1)
            .animation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 2, initialVelocity: 3), value: animated)
            
            Text(countLikes(photo:photo))
            Spacer()
            Label(String(photo.reposts.count), systemImage: "arrowshape.turn.up.forward")
        }
        .onAppear {
            self.viewModelFriendsPhoto.getFriendPhoto(friend: friend)
        }
    }
    
    
    func animatedHeart () {
        let animationDuration = 0.1
        self.animated = true
        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration, execute: {
            self.animated = false
            self.viewModelFriendsPhoto.getFriendPhoto(friend: friend)
        })
    }
    
    
    func countLikes(photo : Photo) -> String {
        var count = String(photo.likes.count)
        self.viewModelFriendsPhoto.likes.forEach { (photoId, isLikedPhoto) in
            if isLikedPhoto == 0 {
                self.viewModelLikes.countLikedPhotoForCurrentFriend.forEach { (key, value) in
                    if key == photo.id {
                        count = String(value)
                    }
                }
            }
            else {
                self.viewModelDeleleLike.setNoLikedPhotoForCurrentFriend.forEach { (key, value) in
                    if key == photo.id {
                        count = String(value)
                    }
                }
            }
        }
        return count
    }
    
    
    func isHeart (likes : [Int : Int], photo : Photo) -> String {
        var isHeart = "heart"
        if photo.likes.userLikes == 0 {
            isHeart = "heart"
        } else {
            isHeart = "heart.fill"
        }
        self.viewModelFriendsPhoto.likes.forEach { (photoId, isLikedPhoto) in
            if isLikedPhoto == 0 {
                self.viewModelLikes.isLikedPhotoForCurrentFriend.forEach { (key, value) in
                    if key == photo.id,
                       value == 1
                    {
                        isHeart = "heart.fill"
                    }
                }
            }
            else {
                self.viewModelDeleleLike.isLikedPhotoForCurrentFriend.forEach { (key, value) in
                    if key == photo.id,
                       value == 0
                    {
                        isHeart = "heart"
                    }
                }
            }
        }
        return isHeart
    }
}


