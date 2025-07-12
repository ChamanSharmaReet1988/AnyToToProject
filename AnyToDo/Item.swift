//
//  Item.swift
//  AnyToDo
//
//  Created by Chaman on 11/07/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
