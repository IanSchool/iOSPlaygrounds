//
//  Game.swift
//  Fyre
//
//  Created by Ian Stedham on 4/16/20.
//  Copyright © 2020 Ian Stedham. All rights reserved.
//

import Foundation

struct Game {
    var numOfPlayersValue: Int = 0
    var goldAtStart: Int = 0
    var personPlayer: Player = Player(cardsInHand: [], goldRemaining: 0, person: false)
    var cpu1: Player = Player(cardsInHand: [], goldRemaining: 0, person: false)
    var cpu2: Player = Player(cardsInHand: [], goldRemaining: 0, person: false)
    var cpu3: Player = Player(cardsInHand: [], goldRemaining: 0, person: false)
    var playerList: [Player] = []
    var cardInPlay: Card = Card(cardNum: 0, cardType: "", cardName: "")
    var starter: [Card] = []
    var deck = Deck()
    
    mutating func start(playerCount: Int, startingGold: Int) {
        for _ in 1...playerCount {
            starter = deck.startingHand()
            if playerCount == 1 {
                personPlayer = Player(cardsInHand: starter, goldRemaining: startingGold, person: true)
                playerList.append(personPlayer)
            }
            else {
                if playerCount == 2 {
                    cpu1 = Player(cardsInHand: starter, goldRemaining: startingGold, person: false)
                    playerList.append(cpu1)
                }
                else if playerCount == 3 {
                    cpu2 = Player(cardsInHand: starter, goldRemaining: startingGold, person: false)
                    playerList.append(cpu2)
                }
                else if playerCount == 4 {
                    cpu3 = Player(cardsInHand: starter, goldRemaining: startingGold, person: false)
                    playerList.append(cpu3)
                }
            }
        }
    }
    
    func cardPlayable (cardPlayed: Card) -> Bool {
        if cardPlayed.cardNum == cardInPlay.cardNum || cardPlayed.cardType == cardInPlay.cardType {
            return true
        }
        return false
    }
}
