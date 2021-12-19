//
//  NewsService.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 17.12.2021.
//

import Foundation
import Combine
import Alamofire

protocol ServiceInputNews: AnyObject {
    func get() -> AnyPublisher<VKNews, AFError>
}

class NewsService : ServiceInputNews {
    
    private let scheme = "https://"
    private let host = "api.vk.com/"
    private let path = "method/newsfeed.get"
    private let token = Session.shared.token
    private let id = Session.shared.userId
    private let version = Session.shared.version
    
    func get() -> AnyPublisher<VKNews, AFError>{
        
        let parameters: Parameters = [
            "user_id": id,
            "access_token" : token,
            "v" : version,
            "filters": "post"
        ]
        
        let publisher = AF.request(scheme + host + path, method: .get, parameters: parameters)
            .publishDecodable(type: VKNews.self)
        
        return publisher.value()
            .eraseToAnyPublisher()
    }
}