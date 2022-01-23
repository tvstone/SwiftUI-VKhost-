//
//  SetLike.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 02.01.2022.
//
import Foundation
import Combine
import Alamofire

struct RequestParam: Codable {
    let key, value: String?
}

protocol SetLikeProtocol: AnyObject {
    func set(friend : Item, photo: Photo) -> AnyPublisher<RequestParam, AFError>
}

class SetLike : SetLikeProtocol {
    
    private let scheme = "https://"
    private let host = "api.vk.com/"
    private let path = "method/likes.add"
    private let token = Session.shared.token
    private let version = Session.shared.version
    
    func set(friend : Item, photo: Photo) -> AnyPublisher<RequestParam, AFError>{
        
        let parameters: Parameters = [
            "owner_id": friend.id,
            "type": "photo",
            "item_id": photo.id,
            "access_token" : token,
            "v" : version
        ]
        let publisher = AF.request(scheme + host + path, method: .get, parameters: parameters)
            .publishDecodable(type: RequestParam.self)
        return publisher.value()
            .eraseToAnyPublisher()
    }
}

