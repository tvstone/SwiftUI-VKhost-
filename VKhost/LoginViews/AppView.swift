//
//  AppView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 03.12.2021.
//

import SwiftUI

struct AppView: View {
    
    @State private var willShouBaseView : Bool = false
    var startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)

    init (){
        UITabBar.appearance().barTintColor = startColor
        UINavigationBar.appearance()
            .titleTextAttributes = [.font :
                                        UIFont(name: "Georgia-Bold",size: 24) ?? .boldSystemFont(ofSize: 24),
                                    .foregroundColor : UIColor(.white)]
        UINavigationBar.appearance().barTintColor = startColor
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                LoginView(showBaseView: $willShouBaseView)
                if willShouBaseView {
                    BaseView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

