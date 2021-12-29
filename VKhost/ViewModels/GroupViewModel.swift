//
//  GroupViewModel.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 14.12.2021.
//
import Foundation
import Combine

class GroupViewModel : ObservableObject {
    
    @Published var groups : [Group] = []
    private let groupService = GroupService()
    private var cancellation: AnyCancellable?
    
    init(){
        getGroups()
    }
    
    func getGroups() {
        cancellation = groupService.get()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { group in
                self.groups = group.response.items
            })
    }
}
