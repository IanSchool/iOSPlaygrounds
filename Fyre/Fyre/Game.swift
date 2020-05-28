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
    var currentPot: Int
    
    init(playerCount: Int, startingGold: Int) {
        numOfPlayersValue = playerCount
        goldAtStart = startingGold
        for num in 1...playerCount {
            starter = deck.startingHand()
            if num == 1 {
                personPlayer.cardsInHand += starter
                personPlayer.goldRemaining = startingGold
                personPlayer.person = true
                playerList.append(personPlayer)
            }
            else if num == 2 {
                cpu1.cardsInHand = starter
                cpu1.goldRemaining = startingGold
                cpu1.person = false
                playerList.append(cpu1)
            }
            else if num == 3 {
                cpu2.cardsInHand = starter
                cpu2.goldRemaining = startingGold
                cpu2.person = false
                playerList.append(cpu2)
            }
            else if num == 4 {
                cpu3.cardsInHand = starter
                cpu3.goldRemaining = startingGold
                cpu3.person = false
                playerList.append(cpu3)
            }
        }
        cardInPlay = deck.randomCard()
        currentPot = 0
    }
}
