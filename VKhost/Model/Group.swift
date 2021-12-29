//
//  Group.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 07.12.2021.
//

import Foundation

// MARK: - VKGroup
struct VKGroup: Codable {
    let response: ResponseGroup
}

// MARK: - Response
struct ResponseGroup: Codable {
    let count: Int
    let items: [Group]
}

// MARK: - Item
struct Group: Codable, Identifiable {
    let id: Int
    let name, screenName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case avatar = "photo_200"
    }
}
