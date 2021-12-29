//
//  BaseView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 03.12.2021.
//
import SwiftUI

struct BaseView: View {
    
    @State private var isLogin : Bool = false
    private var startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    @StateObject var newsModel = NewsViewModel()
    
    init (){
        UITabBar.appearance().barTintColor = startColor
        UINavigationBar.appearance()
            .titleTextAttributes = [.font :
                                        UIFont(name: "Georgia-Bold",size: 22) ?? .boldSystemFont(ofSize: 22),
                                    .foregroundColor : UIColor(.white)]
        UINavigationBar.appearance().barTintColor = startColor
    }
    var body: some View {
        ZStack {
            if !isLogin {
                VKLoginWebView(isLogin: $isLogin)
            } else {
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
                .accentColor(.white)
            }
        }
        
    }
}
