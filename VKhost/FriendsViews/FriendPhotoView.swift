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
                                    KFImage(URL(string: photo.sizes.last?.url ?? ""))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .frame(height: 150)
                                        .cornerRadius(10)
                                        .shadow(color: .white, radius: 2)
                                }
                            }
                        }
                }
                .onAppear {
                    viewModelFriendsPhoto.getFriendPhoto(friend: self.friend)
            }
        }
    }
}
