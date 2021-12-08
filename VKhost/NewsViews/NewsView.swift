//
//  NewsView.swift.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 03.12.2021.
//

import SwiftUI

struct NewsView: View {
    
    var startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(self.startColor)
                    .ignoresSafeArea(.all)
                ScrollView {
                    Spacer()
                    Text("Новостная лента")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold,
                                      design: .serif))
                        .padding(.vertical, 200)
                }
            }
            .navigationBarTitle("Новости", displayMode: .inline)
        }
    }
}

struct NewsView_swift_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
