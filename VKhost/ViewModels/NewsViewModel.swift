//
//  NewsViewModel.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 17.12.2021.
//

import Foundation
import Combine

class NewsViewModel : ObservableObject {
    
    @Published var news : [News] = []
    @Published var groups : [GroupNews] = []
    
    private let newsService = NewsService()
    private var cancellation: AnyCancellable?
    
    init(){
        getNews()
    }
    
    func getNews() {
        cancellation = newsService.get()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { news in
                self.news = news.response.items
                self.groups = news.response.groups
            })
    }
}
