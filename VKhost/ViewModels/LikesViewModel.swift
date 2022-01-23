//
//  LikesViewModel.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 02.01.2022.
//

import Foundation
import Combine

class LikesViewModel : ObservableObject {
    
    @Published var countLikedPhotoForCurrentFriend : [Int : Int] = [:]
    @Published var isLikedPhotoForCurrentFriend : [Int : Int] = [:]
    private let likesService = SetLike()
    private var cancellation: AnyCancellable?
    
    func setLikeOnPhoto(friend : Item, photo : Photo) {
        cancellation = likesService.set(friend: friend, photo: photo)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { _ in })
        
        if photo.likes.userLikes == 0 {
            self.countLikedPhotoForCurrentFriend.updateValue(photo.likes.count + 1, forKey: photo.id)
        } else{
            self.countLikedPhotoForCurrentFriend.updateValue(photo.likes.count, forKey: photo.id)
        }
        self.isLikedPhotoForCurrentFriend.updateValue(1, forKey: photo.id)
    }
}
