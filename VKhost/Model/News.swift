//
//  News.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 16.12.2021.


import Foundation

// MARK: - VKNews
struct VKNews: Codable {
    let response: ResponseNews
}

// MARK: - ResponseNews
struct ResponseNews: Codable {
    let items: [News]
    let groups: [GroupNews]
    let nextFrom: String

    enum CodingKeys: String, CodingKey {
        case items, groups
        case nextFrom = "next_from"
    }
}

// MARK: - News
struct News: Codable, Identifiable {
    let id : Int
    let date: Int
    let text: String?
    let attachments: [Attachment]?
    let comments: Comments?
    let likes: LikesNews?
    let reposts: RepostsNews?
    let views: Views?

    enum CodingKeys: String, CodingKey {
        case id = "source_id"
        case date
        case text
        case attachments = "attachments"
        case comments, likes, reposts, views
    }
}
// MARK: - Attachment
struct Attachment: Codable {
      let photo: LinkPhoto?
}

// MARK: - LinkPhoto
struct LinkPhoto: Codable {
    let sizes: [SizeNews]
}
// MARK: - SizeNews
struct SizeNews : Codable {
    let url : String
}

// MARK: - Comments
struct Comments: Codable {
    let count: Int
}

// MARK: - LikesNews
struct LikesNews: Codable {
    let count: Int
}

// MARK: - RepostsNews
struct RepostsNews: Codable {
    let count: Int
}

// MARK: - Views
struct Views: Codable {
    let count: Int
}

// MARK: - Group
struct GroupNews: Codable, Identifiable {
    let id: Int
    let name: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case avatar = "photo_200"
    }
}
