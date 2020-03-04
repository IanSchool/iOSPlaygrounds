//
//  File.swift
//  EmojiDictionary
//
//  Created by Ian on 3/3/20.
//  Copyright © 2020 Ian. All rights reserved.
//

import Foundation

struct Emoji {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init (symbol: String, name: String, description: String, usage: String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}

