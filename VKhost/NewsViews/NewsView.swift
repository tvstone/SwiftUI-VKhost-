//
//  NewsView.swift.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 03.12.2021.
//

import SwiftUI
import Kingfisher

struct NewsView: View {
    
    @ObservedObject var viewModelNews = NewsViewModel()
    
    private let startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    
    var columns: [GridItem] = [
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            ZStack {
                Color(self.startColor)
                    .ignoresSafeArea(.all)
                ScrollView {
                    
                    LazyVGrid(
                        columns: columns,
                        alignment: .center ,
                        spacing: 6) {
                            ForEach(viewModelNews.news) { news in
                                    imageView(news: news)
                            }
                        }
                        
                }
                .onAppear {
                    viewModelNews.getNews()
                }
                .onDisappear {
                    viewModelNews.news = []
                }
            }
            .navigationBarTitle("Новости", displayMode: .inline)
        }
    }
 
    func imageView(news : News)-> some View{
       return VStack {
        let image = news.attachments?.first?.photo?.sizes.last?.url  ?? ""
            if image != "" {
                HStack{
                    ForEach(viewModelNews.groups) { group in
                        let id = String(news.id)
                        if id == "-" + String(group.id) {
                            KFImage(URL(string: group.avatar))
                                .cancelOnDisappear(true)
                                .resizable()
                                .avatarViewMod()
                            Text(group.name)
                                .titleViewMod()
                    }
                }
            }
                Text(news.text ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold, design: .serif))
                KFImage(URL(string:image))
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
}

