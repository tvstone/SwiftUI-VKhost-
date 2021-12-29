//
//  FriendPhotoService.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 15.12.2021.
//
import Foundation
import Alamofire
import Combine

protocol ServiceInputPhoto: AnyObject {
    func get(friendForPhoto : Item) -> AnyPublisher<VKFriendPhoto, AFError>
}

class FriendPhotoService : ServiceInputPhoto {
    
    private let scheme = "https://"
    private let host = "api.vk.com/"
    private let path = "method/photos.getAll"
    private let token = Session.shared.token
    private let version = Session.shared.version
    
    func get(friendForPhoto : Item) -> AnyPublisher<VKFriendPhoto, AFError>{
        let parameters: Parameters = [
            "owner_id": friendForPhoto.id,
            "extended" : "1",
            "access_token" : token,
            "v" : version
        ]
        
        let publisher = AF.request(scheme + host + path, method: .get, parameters: parameters)
            .publishDecodable(type: VKFriendPhoto.self)
        
        return publisher.value()
            .eraseToAnyPublisher()
    }
}
