//
//  GroupInfoView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 07.12.2021.
//

import SwiftUI

struct GroupInfoView: View {
    let startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    var group : GroupVK


    var body: some View {
        ZStack {
            Color(startColor)
                .ignoresSafeArea()
            Text("Новости группы \(group.name)")
                .font(.title3)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .semibold,
                              design: .serif))
        }
    }
}

struct GroupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GroupInfoView(group: GroupVK(name: "", avaGroup: ""))
    }
}
