//
//  GroupsService.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 14.12.2021.
//
import Foundation
import Alamofire
import Combine

protocol ServiceInputGroup: AnyObject {
    func get() -> AnyPublisher<VKGroup, AFError>
}

class GroupService : ServiceInputGroup {
    
    private let scheme = "https://"
    private let host = "api.vk.com/"
    private let path = "method/groups.get"
    private let token = Session.shared.token
    private let id = Session.shared.userId
    private let version = Session.shared.version
    
    func get() -> AnyPublisher<VKGroup, AFError>{
        
        let parameters: Parameters = [
            "user_id": id,
            "extended" : "1",
            "access_token" : token,
            "v" : version
        ]
        
        let publisher = AF.request(scheme + host + path, method: .get, parameters: parameters)
            .publishDecodable(type: VKGroup.self)
        
        return publisher.value()
            .eraseToAnyPublisher()
    }
}
