//
//  Deck.swift
//  Fyre
//
//  Created by Ian Stedham on 4/24/20.
//  Copyright © 2020 Ian Stedham. All rights reserved.
//

import Foundation

struct Deck {
    var deck: [Card] = []
    init() {
        let suits = ["H", "C", "S", "D"]
        for number in 1...13 {
            for s in suits {
                let card = Card(cardNum: number, cardType: s, cardName: (String(number) + s))
                deck.append(card)
            }
        }
    }
    
    mutating func randomCard() -> Card{
        let randomInit = Int.random(in: 0..<52)
        let cardSelected = deck[randomInit]
        deck.remove(at: randomInit)
        return cardSelected
    }
    
    mutating func startingHand() -> [Card] {
        let hand = [randomCard(), randomCard(), randomCard(), randomCard()]
        return hand
    }
}
