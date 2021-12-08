//
//  BaseView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 03.12.2021.
//

import SwiftUI

struct BaseView: View {

    var startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    @State var selectedFriend : Bool = false
    @State var selectedGroup : Bool = false
    @State var selectedNews : Bool = false

    var body: some View {
        
        TabView(){
            FriendsView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("Друзья")
                }
            GropView()
                .tabItem {
                    Image(systemName: "person.3.sequence.fill")
                    Text("Группы")
                }
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Новости")
                }
        }
        .accentColor(.white )
       
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            BaseView()
                .previewDevice("iPhone SE")
            BaseView()
                .previewDevice("iPhone 12")
        }
    }
}

