//
//  FriendPhotoViewModel.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 15.12.2021.
//
import Foundation
import Combine
//import SwiftUI

class FriendPhotoViewModel : ObservableObject {
    
    @Published var photos : [Photo] = []
    private let friendPhotoService = FriendPhotoService()
    private var cancellation: AnyCancellable?
    
    func getFriendPhoto(friend : Item) {
        cancellation = friendPhotoService.get(friendForPhoto: friend)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { photo in
                self.photos = photo.response.items
            })
    }
}

