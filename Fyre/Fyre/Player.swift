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
    
    func showHand() -> String {
        var hand: String = ""
        if cardsInHand.count != 0 {
            for num in 0...cardsInHand.count - 1 {
                hand += cardsInHand[num].cardName + ", "
            }
        }
        return hand
    }
}
