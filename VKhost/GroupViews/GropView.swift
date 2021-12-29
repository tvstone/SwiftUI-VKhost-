//
//  GropView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 30.11.2021.
//
import SwiftUI

struct GropView: View {
    
    @ObservedObject var viewModelGroup = GroupViewModel()
    
    var body: some View {
        
        NavigationView() {
            ZStack {
                Color(#colorLiteral(red: 0.0181156043, green: 0.04797068983, blue: 0.2869391739, alpha: 1))
                    .ignoresSafeArea(.all)
                ScrollView {
                    ForEach(viewModelGroup.groups) { group in
                        NavigationLink(destination: GroupInfoView(group: group)) {
                            GroupCell(avatar: group.avatar, name: group.name)     
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("Мои группы", displayMode: .inline)
        }
    }
}



