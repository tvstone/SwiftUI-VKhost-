//
//  CellForFriends.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.11.2021.
//

import SwiftUI

struct CellForFriend: View {
    var body: some View {
        
        HStack{
            Label("Фамилия друга", image: "seal")
                .font(.system(size: 20, weight: .semibold, design: .serif))
        }
    }
}
struct CellForFriend: PreviewProvider {
    static var previews: some View {
        CellForFriend()
    }
}
