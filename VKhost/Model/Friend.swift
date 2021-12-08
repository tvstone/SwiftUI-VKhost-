//
//  Friend.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 06.12.2021.
//

import Foundation

struct Friend :Identifiable {
    let id = UUID()
    let name : String
    let avaFriend : String
    let additionalInfo : String
}

class LoadFriends {

    func myFriends()-> [Friend] {

        var friends = [Friend]()

        let a = Friend(name: "Алексей Иванов", avaFriend: "1", additionalInfo: "город Москва")
        friends.append(a)

        let b = Friend(name: "Игорь Сукнов", avaFriend: "2", additionalInfo: "город Киров")
        friends.append(b)

        let c = Friend(name: "Роман Виктюк", avaFriend: "3", additionalInfo: "город Москва")
        friends.append(c)

        let d = Friend(name: "Диана Алексеева", avaFriend: "4", additionalInfo: "город Петербугр")
        friends.append(d)

        let e = Friend(name: "Лариса Ефимова", avaFriend: "5", additionalInfo: "город Омск")
        friends.append(e)

        let f = Friend(name: "Сергей Антонов", avaFriend: "6", additionalInfo: "город Киев")
        friends.append(f)

        let j = Friend(name: "Антон Сергеев", avaFriend: "7", additionalInfo: "город Москва")
        friends.append(j)

        let h = Friend(name: "Артур Крид", avaFriend: "8", additionalInfo: "город Загорск")
        friends.append(h)

        let i = Friend(name: "Ольга Шмелева", avaFriend: "9", additionalInfo: "город Ульяновск")
        friends.append(i)

        let g = Friend(name: "Степан Орлов", avaFriend: "10", additionalInfo: "город Саранск")
        friends.append(g)

        return friends
    }
}
