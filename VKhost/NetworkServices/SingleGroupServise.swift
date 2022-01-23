//
//  SingleGroupServise.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 18.12.2021.
//

import Foundation
import Combine
import Alamofire

protocol ServiceInputSingleGroup: AnyObject {
    func get(group : Group) -> AnyPublisher<VKInGroup, AFError>
}

class SingleGroupServise : ServiceInputSingleGroup {
    
    private let scheme = "https://"
    private let host = "api.vk.com/"
    private let path = "method/wall.get"
    private let token = Session.shared.token
    private let id = Session.shared.userId
    private let version = Session.shared.version
    
    func get(group : Group) -> AnyPublisher<VKInGroup, AFError>{
        
        let parameters: Parameters = [
            "owner_id" : -group.id,
            "filter": "owner",
            "access_token" : token,
            "v" : version,
            
        ]
        let publisher = AF.request(scheme + host + path, method: .get, parameters: parameters)
            .publishDecodable(type: VKInGroup.self)
        return publisher.value()
            .eraseToAnyPublisher()
    }
}
