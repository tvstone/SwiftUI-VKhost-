//
//  ContentView.swift
//  CodingStyle
//
//  Created by Владислав Тихоненков on 23.12.2021.
//

import SwiftUI

class Session {
    static let shared = Session()
    var inputString : String = "Expressions are now allowed at the top"
}

struct ContentView: View {
   
    @CodingStyle(style: .camelCase) var inputString1 : String = Session.shared.inputString
    @CodingStyle(style: .snakeCase) var inputString2 : String = Session.shared.inputString
    @CodingStyle(style: .kebabCase) var inputString3 : String = Session.shared.inputString
    
    var body: some View {
        VStack {
            Text("Исходный текст :\n \(Session.shared.inputString)")
                .padding()
            Text("CamelCase:\n \(inputString1)")
                .padding()
            Text("SnakeCase:\n \(inputString2)")
                .padding()
            Text("KebabCase:\n \(inputString3)")
                .padding()
        }.frame(width: 380,alignment: .leading )
    }

}
