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
    
    mutating func fold() {
        for _ in 1...cardsInHand.count {
            cardsInHand.remove(at: 0)
        }
    }
    
    func raise(amount: Double) -> Int {
        let raisedAmount = Double(goldRemaining) * amount
        return Int(raisedAmount)
    }
}
