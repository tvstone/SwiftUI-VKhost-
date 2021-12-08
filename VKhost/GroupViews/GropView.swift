//
//  GropView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.11.2021.
//

import SwiftUI

struct GropView: View {
    
    var startColor = #colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1)
    @State var avatar : String = "bred"
    @State var nameGroup : String = "Название группы "
    private var groups : [GroupVK] {
        let loadGroups = LoadGroup().meGroups()
        return loadGroups
    }

    
    var body: some View {
        NavigationView() {
            ZStack {
                Color(startColor)
                    .ignoresSafeArea(.all)
                ScrollView() {
                    ForEach(groups) { group in
                        NavigationLink {
                            GroupInfoView(group: group)
                        } label: {
                            GroupCell(avatar: group.avaGroup, name: group.name)
                        }

                    }

                    Spacer()
                }
            }
            .navigationBarTitle("Мои группы", displayMode: .inline)
        }
    }
}

struct GropView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            GropView()
                .previewDevice("iPhone SE")
            GropView()
                .previewDevice("iPhone 12")
        }
    }
}



