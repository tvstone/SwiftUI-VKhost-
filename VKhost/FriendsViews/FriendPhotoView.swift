//
//  FriendPhotoView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 07.12.2021.
//

import SwiftUI
import Kingfisher

struct FriendPhotoView: View {
    
    var friend : Item
    @ObservedObject var viewModelFriendsPhoto = FriendPhotoViewModel()
    @State private var idPhotoOnTap : String = ""
    @State var isScaled : Bool = false
    private let startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    
    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        
        ZStack {
            Color(startColor)
                .ignoresSafeArea()
            
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 10) {
                        ForEach(viewModelFriendsPhoto.photos) { photo in
                            NavigationLink(destination: FullSizePhoto(url: photo.sizes.last?.url ?? "") ) {
                                LazyVStack{
                                    KFImage(URL(string: photo.sizes.last?.url ?? ""))
                                        .cancelOnDisappear(true)
                                        .resizable()
                                        .newsViewMod()
                                    
                                    if String(photo.id) != self.idPhotoOnTap {
                                        likesBarPhotoIsOff(photo: photo)
                                    }
                                    else {
                                        likesBarPhotoIsOn(photo: photo)
                                        
                                    }
                                }
                            }
                        }
                    }
            }
            .onAppear {
                viewModelFriendsPhoto.getFriendPhoto(friend: self.friend)
            }
        }
    }
    
    
    func likesBarPhotoIsOff(photo : Photo)-> some View {
        
        let userLikes = photo.likes.userLikes
        let likes = String(photo.likes.count)
        var heart : String {
            if userLikes == 0 { return "heart"} else { return "heart.fill"}
        }
        let reposts = String(photo.reposts.count)
        let isScaledEffect = true
        return likesBar(photo: photo, heart: heart, likes: likes, reposts: reposts, isScaledEffect : isScaledEffect)
    }
    
    func likesBarPhotoIsOn(photo : Photo)-> some View {
        let heart = "heart.fill"
        let likes = String(photo.likes.count)
        let reposts = String(photo.reposts.count)
        let isScaledEffect = false
        return  likesBar(photo: photo, heart: heart, likes: likes, reposts: reposts, isScaledEffect : isScaledEffect)
    }
    
    func likesBar( photo : Photo, heart : String, likes : String, reposts : String, isScaledEffect : Bool ) -> some View {
        
        LazyHStack{
            Label(likes, systemImage: heart)
                .padding(6)
                .scaleEffect(isScaled ? 1.1 : 1)
                .onTapGesture {
                    self.idPhotoOnTap = String(photo.id)
                    withAnimation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 2, initialVelocity: 8)) {
                        self.isScaled.toggle()
                    }
                }
            Label(reposts, systemImage: "arrowshape.turn.up.forward")
                .padding(6)
        }
        .foregroundColor(.white)
        .font(.system(size: 14, weight: .semibold, design: .serif))
    }
}
