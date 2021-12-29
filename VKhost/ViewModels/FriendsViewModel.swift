//
//  FriendsViewModel.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 09.12.2021.
//
import Foundation
import Combine

class FriendsViewModel : ObservableObject {
    
    @Published var friends : [Item] = []
    
    private let friendsService = FriendsService()
    private var cancellation: AnyCancellable?
    
    init(){
        getFriends()
    }
    
    func getFriends() {
        cancellation = friendsService.get()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { friends in
                self.friends = friends.response.items
            })
    }
}
