//
//  ExtensionView.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 27.12.2021.
//

import SwiftUI

extension View {
    
    func titleMod () -> some View {
        return self.modifier(FullName())
    }
    func avatarMod () -> some View {
        return self.modifier(AvatarView())
    }
    func avaAnimation() -> some View {
        return self.modifier(AvaDumpingAnimation())
    }
    func titleViewMod () -> some View {
        return self.modifier(FullNameView())
    }
    func additionalViewMod ()-> some View {
        return self.modifier(AddInformation())
    }
    func newsViewMod () -> some View {
        return self.modifier(SingleNewsView())
    }
    
}
