//
//  Item.swift
//  ToolbarStickies
//
//  Created by Aniruddha Deb on 05/11/23.
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
