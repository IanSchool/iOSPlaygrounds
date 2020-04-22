//
//  Game.swift
//  Fyre
//
//  Created by Ian Stedham on 4/16/20.
//  Copyright © 2020 Ian Stedham. All rights reserved.
//

import Foundation

struct Game {
    var numOfPlayersValue: Int
    var goldAtStart: Int
    var personPlayer: Player
    var cpu1: Player
    var cpu2: Player
    var cpu3: Player
    var playerList: [Player]
    var cardInPlay: Card
    
    mutating func gameStart(playerCount: Int, startingGold: Int) {
        for _ in 0...playerCount {
            if playerCount == 0 {
                personPlayer = Player(cardsInHand: Card(cardNum: 1, cardType: "s", specialCard: false), goldRemaining: startingGold, person: true)
                playerList.append(personPlayer)
            }
            else {
                if playerCount == 1 {
                    cpu1 = Player(cardsInHand: Card(cardNum: 1, cardType: "s", specialCard: false), goldRemaining: startingGold, person: false)
                    playerList.append(cpu1)
                }
                else if playerCount == 2 {
                    cpu2 = Player(cardsInHand: Card(cardNum: 1, cardType: "s", specialCard: false), goldRemaining: startingGold, person: false)
                    playerList.append(cpu2)
                }
                else if playerCount == 3 {
                    cpu3 = Player(cardsInHand: Card(cardNum: 1, cardType: "s", specialCard: false), goldRemaining: startingGold, person: false)
                    playerList.append(cpu3)
                }
            }
        }
    }
    
    func cardPlayable (cardPlayed: Card) -> Bool {
        
    }
}
