//
//  Group.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 07.12.2021.
//

import Foundation

struct GroupVK :Identifiable {
    let id = UUID()
    let name : String
    let avaGroup : String
}

class LoadGroup {
    
    func meGroups()-> [GroupVK] {
        var groups = [GroupVK]()
        
        let a = GroupVK(name: "Игромания", avaGroup: "30")
        groups.append(a)
        
        let b = GroupVK(name: "RECORD", avaGroup: "21")
        groups.append(b)
        
        let c = GroupVK(name: "Samsung", avaGroup: "22")
        groups.append(c)
        
        let d = GroupVK(name: "СТАРКОН", avaGroup: "23")
        groups.append(d)
        
        let e = GroupVK(name: "Европа Плюс", avaGroup: "24")
        groups.append(e)
        
        let f = GroupVK(name: "Ленинград", avaGroup: "25")
        groups.append(f)
        
        let j = GroupVK(name: "DFM", avaGroup: "26")
        groups.append(j)
        
        let h = GroupVK(name: "Страна Игр", avaGroup: "27")
        groups.append(h)
        
        let i = GroupVK(name: "Ночлежка", avaGroup: "28")
        groups.append(i)
        
        let g = GroupVK(name: "БОРЩ", avaGroup: "29")
        groups.append(g)
        
        return groups
    }
}
