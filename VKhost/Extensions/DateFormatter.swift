//
//  DateFormatter.swift
//  VKhost
//
//  Created by Владислав Тихоненков on 28.12.2021.
//

import Foundation

public let dateFormatter : DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = "d MMM HH:mm"
    return df
}()
