//
//  ViewModifires.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 27.12.2021.
//

import SwiftUI

struct FullNameView : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 200,  maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 20, weight: .semibold, design: .serif))
            .foregroundColor(.white)
            .padding(.leading, 6)
            .padding(.trailing, 6)
            .shadow(color: .white.opacity(0.5), radius: 10, x: 5, y: 5)
    }
}

struct AddInformation : ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .padding(.leading)
            .shadow(color: .black.opacity(0.7), radius: 10, x: 0, y: 0)
    }
}

struct AvaDumpingAnimation : ViewModifier {
    @State private var isAnimate : Bool = false
    
    func body(content : Content) -> some View {
        content
            .scaleEffect(isAnimate ? 1.05 : 1)
            .animation(.interpolatingSpring(mass: 2, stiffness: 100, damping: 5, initialVelocity: 2), value: self.isAnimate)
            .animation(.spring(response: 0.5, dampingFraction: 2, blendDuration: 0.5))
            .onAppear {
                self.isAnimate.toggle()
            }
    }
}

struct FullName : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 200,  maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 18, weight: .semibold, design: .serif))
            .foregroundColor(.white)
            .padding(.leading, 10)
            .padding(.trailing, 14)
            .shadow(color: .white.opacity(0.5), radius: 10, x: 5, y: 5)
    }
}

struct AvatarView : ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: 70 , height: 70, alignment: .center )
            .clipShape(Circle())
            .shadow(color: .white.opacity(0.5), radius: 5, x: 2, y: 2)
    }
}

struct SingleNewsView : ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 150)
            .cornerRadius(10)
            .shadow(color: .white, radius: 2)
            .animation(.spring(response: 0.5, dampingFraction: 2, blendDuration: 0.5))
    }
}

struct likeDumpingAnimation : ViewModifier {
    @State private var isAnimate : Bool = false
    
    func body(content : Content) -> some View {
        content
            .scaleEffect(isAnimate ? 1.05 : 1)
            .animation(.interpolatingSpring(mass: 2, stiffness: 100, damping: 5, initialVelocity: 2), value: self.isAnimate)
            .onAppear {
                self.isAnimate.toggle()
            }
    }
}


