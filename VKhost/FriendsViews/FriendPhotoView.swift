//
//  FriendPhotoView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 07.12.2021.
//

import SwiftUI


struct FriendPhotoView: View {
    let friend : Friend
    let startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    var columns: [GridItem] = [
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16)

    ]


    var body: some View {

            ZStack {
                Color(startColor)
                    .ignoresSafeArea()
                ScrollView {
                       LazyVGrid(
                           columns: columns,
                           alignment: .center,
                           spacing: 16) {
                           Section(header: Text("Галерея фото  \(friend.name)")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold,
                                                  design: .serif))) {
                               ForEach(0...80, id: \.self) { index in
                                   Color(.random)
                               }
                           }
                       }
                   }
               }
            }
    }


struct FriendPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        FriendPhotoView(friend: Friend(name: "", avaFriend: "", additionalInfo: ""))
    }
}
