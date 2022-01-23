//
//  NewsView.swift.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 03.12.2021.
//

import SwiftUI
import Kingfisher
import BBRefreshableScrollView

struct NewsView: View {
    
    @ObservedObject var viewModelNews = NewsViewModel()
    private let startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    private let bar = UINavigationBar.appearance()
    var columns: [GridItem] = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(self.startColor)
                    .ignoresSafeArea(.all)
                BBRefreshableScrollView { completion in
                    addNewNews {
                        completion()
                    }
                } content: {
                    LazyVGrid(
                        columns: columns,
                        alignment: .leading ,
                        spacing: 12) {
                            ForEach(viewModelNews.news) { news in
                                imageView(news: news)
                            }
                        }
                }
                .onAppear {
                    viewModelNews.getNews(nextFrom: "")
                }
                .onDisappear {
                    viewModelNews.news = []
                }
            }
            .navigationBarTitle("Новости", displayMode: .inline)
        }
    }
    
    
    func imageView(news : News)-> some View{
        let dNews = Date(timeIntervalSince1970: Double(news.date))
        let dateNews = dateFormatter.string(from: dNews)
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
                                .avatarMod()
                            VStack() {
                                Text(group.name)
                                    .titleViewMod()
                                HStack {
                                    Text(dateNews)
                                        .padding(.leading, 6)
                                        .font(.system(size: 14, weight: .semibold, design: .serif))
                                        .foregroundColor(.gray)
                                        .shadow(color: .white.opacity(0.5), radius: 10, x: 5, y: 5)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                Text(news.text ?? "")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold, design: .serif))
                    .padding(.leading, 6)
                    .padding(.trailing, 6)
                KFImage(URL(string:image))
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(10)
                likesBar(news: news)
            }
        }
    }
    
    
    func likesBar( news : News)-> some View {
        HStack{
            let likes = String(news.likes?.count ?? 0)
            let comments = String(news.comments?.count ?? 0)
            let reposts = String(news.reposts?.count ?? 0)
            let viewesCount = String(format: "%.1f", Double(news.views?.count ?? 0)/1000) + "K"
            Label(likes, systemImage: "heart")
                .padding(6)
            Label(comments, systemImage: "bubble.left")
                .padding(6)
            Label(reposts, systemImage: "arrowshape.turn.up.forward")
                .padding(6)
            Spacer()
            Label(viewesCount, systemImage: "eye")
                .padding(6)
        }
        .foregroundColor(.white)
        .font(.system(size: 16, weight: .semibold, design: .serif))
    }
    
    
    func addNewNews(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            viewModelNews.getNews(nextFrom: "")
            completion()
        }
    }
}



