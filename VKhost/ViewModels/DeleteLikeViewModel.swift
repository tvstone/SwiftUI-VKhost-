//
//  DeleteLikeViewModel.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 02.01.2022.
//

import Foundation
import Combine

class DeleteLikeViewModel : ObservableObject {
    
    @Published var setNoLikedPhotoForCurrentFriend : [Int : Int] = [:]
    @Published var isLikedPhotoForCurrentFriend : [Int : Int] = [:]
    private let likesService = DeleteLike()
    private var cancellation: AnyCancellable?
    
    func deleteLikeOnPhoto(friend : Item, photo : Photo) {
        cancellation = likesService.set(friend: friend, photo: photo)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { _ in })
        
        if photo.likes.userLikes == 1 {
            self.setNoLikedPhotoForCurrentFriend.updateValue(photo.likes.count - 1, forKey: photo.id)
        } else{
            self.setNoLikedPhotoForCurrentFriend.updateValue(photo.likes.count, forKey: photo.id)
        }
        self.isLikedPhotoForCurrentFriend.updateValue(0, forKey: photo.id)
    }
}
