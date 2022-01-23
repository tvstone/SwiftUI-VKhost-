//
//  RefreshNews.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 21.12.2021.
//

import SwiftUI

struct RefreshNews: View {
    
    var coordinateSpaceName: String
    var onRefresh: ()->Void
    
    @State var needRefresh: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            if (proxy.frame(in: .named(coordinateSpaceName)).midY > 50) {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if (proxy.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                Spacer()
                    .onAppear {
                        if needRefresh {
                            needRefresh = false
                            onRefresh()
                        }
                    }
            }
            HStack {
                Spacer()
                if needRefresh {
                    ProgressView()
                }
                else {
                    Text("⬇️")
                }
                Spacer()
            }
        }.padding(.top, -50)
            .foregroundColor(.white)
    }
}

//struct RefreshNews_Previews: PreviewProvider {
//    static var previews: some View {
//        RefreshNews()
//    }
//}
