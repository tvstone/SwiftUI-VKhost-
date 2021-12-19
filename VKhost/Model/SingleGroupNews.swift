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
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case date
        case text
        case attachments
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

