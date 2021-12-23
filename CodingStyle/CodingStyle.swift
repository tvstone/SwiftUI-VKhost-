//
//  CodingStyle.swift
//  CodingStyle
//
//  Created by Владислав Тихоненков on 23.12.2021.
//

import Foundation

@propertyWrapper
struct CodingStyle {
    
    private(set) var value: String = ""
    var style : Style

    enum Style {
        case camelCase
        case snakeCase
        case kebabCase
    }

    init (wrappedValue : String, style : Style) {
        self.style = style
        self.wrappedValue = wrappedValue
    }

    var wrappedValue : String {
        get { value}
        set {
            switch style {
            case .camelCase :
                let capitalazed = newValue.capitalized
                let replacing = capitalazed.replacingOccurrences(of: " ", with: "")
                let firstChar = replacing.prefix(1).lowercased()
                let secondChars = replacing.dropFirst()
                value = String(firstChar) + secondChars
            case .snakeCase :
                let lowercased = newValue.lowercased()
                value = lowercased.replacingOccurrences(of: " ", with: "_")
            case .kebabCase :
                let lowercased = newValue.lowercased()
                value = lowercased.replacingOccurrences(of: " ", with: "-")
            }     
        }
    }
}
