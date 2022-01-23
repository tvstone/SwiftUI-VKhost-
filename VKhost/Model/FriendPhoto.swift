//
//  FriendPhoto.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 15.12.2021.
//
import Foundation

// MARK: - VKFriendPhoto
struct VKFriendPhoto: Codable {
    let response: ResponsePhoto
}

// MARK: - ResponsePhoto
struct ResponsePhoto: Codable {
    let count: Int
    let items: [Photo]
}

// MARK: - Photo
struct Photo: Codable, Identifiable {
    let albumID, date, id, ownerID: Int
    let sizes: [Size]
    let text: String
    let likes: Likes
    let reposts: Reposts

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case sizes, text
        case likes, reposts
    }
}

// MARK: - Likes
struct Likes: Codable {
    let userLikes, count: Int

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

// MARK: - Reposts
struct Reposts: Codable {
    let count: Int
}

// MARK: - Size
struct Size: Codable {
    let url: String
}
