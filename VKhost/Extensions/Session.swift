//
//  Session.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 09.12.2021.
//
import Foundation

final class Session{
    static let shared = Session()

    var token: String = ""
    var userId: String  = ""
    let cliendId = "7938282"
    let version = "5.131"
    var nextFrom = ""

}

