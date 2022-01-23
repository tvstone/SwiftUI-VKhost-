//
//  FriendsNetworkService.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 09.12.2021.
//
import Foundation
import Combine
import Alamofire


protocol ServiceInputFriend: AnyObject {
    func get() -> AnyPublisher<VKFriends, AFError>
}

class FriendsService : ServiceInputFriend {
    
    private let scheme = "https://"
    private let host = "api.vk.com/"
    private let path = "method/friends.get"
    private let token = Session.shared.token
    private let id = Session.shared.userId
    private let version = Session.shared.version
    
    func get() -> AnyPublisher<VKFriends, AFError>{
        
        let parameters: Parameters = [
            "user_id": id,
            "fields": "nickname,photo_200_orig",
            "order": "name",
            "access_token" : token,
            "v" : version
        ]
        
        let publisher = AF.request(scheme + host + path, method: .get, parameters: parameters)
            .publishDecodable(type: VKFriends.self)        
        return publisher.value()
            .eraseToAnyPublisher()
    }
}

