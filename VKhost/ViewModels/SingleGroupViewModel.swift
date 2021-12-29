//
//  SingleGroupViewModel.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 18.12.2021.
//
import Foundation
import Combine
//import SwiftUI

class SingleGroupViewModel : ObservableObject {
    
    @Published var singleGroupNews : [SingleGroupNews] = []
    private let singleGroupService = SingleGroupServise()
    private var cancellation: AnyCancellable?

    func getSingleGroupInfo(group : Group) {
        cancellation = singleGroupService.get(group: group)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { singleGroup in
                self.singleGroupNews = singleGroup.response.items
            })
    }
}
