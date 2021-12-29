//
//  SingleGroup.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 18.12.2021.
//

import Foundation

// MARK: - InGroup
struct VKInGroup: Codable {
    let response: ResponseSingleGroup
}

// MARK: - ResponseSingleGroup
struct ResponseSingleGroup: Codable {
    let count: Int
    let items: [SingleGroupNews]
}

// MARK: - SelectedGroup
struct SingleGroupNews: Codable , Identifiable{
    let id, ownerID, date: Int
    let text: String?
    let attachments: [AttachmentSingleGroup]?
    let comments: Comments?
    let likes: LikesNews?
    let reposts: RepostsNews?
    let views: Views?
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case date
        case text,attachments,comments
        case likes, reposts, views
    }
}

// MARK: - AttachmentSingleGroup
struct AttachmentSingleGroup: Codable {
    let photo: PhotoSingleGroup?
}

// MARK: - PhotoSingleGroup
struct PhotoSingleGroup: Codable {
    let sizes: [SizeSingleGroup]
}

// MARK: - SizeSingleGroup
struct SizeSingleGroup: Codable {
    let url: String
}

