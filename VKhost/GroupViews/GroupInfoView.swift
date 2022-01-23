//
//  GroupInfoView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 07.12.2021.
//
import SwiftUI
import Kingfisher

struct GroupInfoView: View {
    
    @ObservedObject var viewModelSingleNews = SingleGroupViewModel()
    
    private let startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    var group : Group
    var columns: [GridItem] = [
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack {
            Color(self.startColor)
                .ignoresSafeArea(.all)
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    alignment: .leading ,
                    spacing: 12) {
                        ForEach(viewModelSingleNews.singleGroupNews) { news in
                            imageView(news: news)
                        }
                    }
            }
            .onAppear {
                viewModelSingleNews.getSingleGroupInfo(group: group)
            }
        }
        .navigationBarTitle((group.name), displayMode: .inline)
    }
    
    
    func imageView(news : SingleGroupNews)-> some View{
        return VStack {
            let image = news.attachments?.first?.photo?.sizes.last?.url  ?? ""
            if image != "" {
                Text(news.text ?? "")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold, design: .serif))
                KFImage(URL(string:image))
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(10)
                likesBar(news: news)
            }
        }
    }
    
    
    func likesBar( news : SingleGroupNews)-> some View {
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
}


