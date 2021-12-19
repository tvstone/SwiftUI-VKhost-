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
                    alignment: .center ,
                    spacing: 6) {
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
            }
        }
    }
}


