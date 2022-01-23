//
//  HideKeyboard.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 04.12.2021.
//

import SwiftUI

extension UIApplication {

    func hideKeyboard() {
        self.sendAction(#selector(UIResponder.resignFirstResponder),
                        to: nil, from: nil, for: nil)
    }
}
