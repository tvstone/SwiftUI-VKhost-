//
//  RandomUIColor.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 07.12.2021.
//
import Foundation
import SwiftUI

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
