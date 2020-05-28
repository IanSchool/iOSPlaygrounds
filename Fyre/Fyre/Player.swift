//
//  Player.swift
//  Fyre
//
//  Created by Ian Stedham on 4/16/20.
//  Copyright © 2020 Ian Stedham. All rights reserved.
//

import Foundation

struct Player {
    var cardsInHand: [Card]
    var goldRemaining: Int
    var person: Bool
    
    func fold() {
        
    }
    
    mutating func raise(amount: Double) -> Int {
        let raisedAmount = Double(goldRemaining) * amount
        goldRemaining -= Int(raisedAmount)
        return Int(raisedAmount)
    }
}
