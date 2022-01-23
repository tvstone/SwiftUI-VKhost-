//
//  Friend.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 06.12.2021.

import Foundation

// MARK: - VKFriends
struct VKFriends : Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable{
    let count: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable , Identifiable{
    let firstName: String
    let id: Int
    let lastName: String
    let city: City?
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case city
        case avatar = "photo_200_orig"
    }
}

// MARK: - City
struct City: Codable {
    let title: String
}
