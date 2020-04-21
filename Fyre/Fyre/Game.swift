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
    var cardInPlay: Cards
    
    /*numOfPlayersValue = Int(numOfPlayers.text!)!
    goldAtStart = Int(startingGold.text!)!
    numOfPlayersValue -= 1
    for playerCount in 0...numOfPlayersValue {
        if playerCount == 0 {
            personPlayer = Player(cardsRemaining: 4, goldRemaining: goldAtStart, person: true)
            playerList.append(personPlayer)
        }
        else {
            if playerCount == 1 {
                cpu1 = Player(cardsRemaining: 4, goldRemaining: goldAtStart, person: false)
                playerList.append(cpu1)
            }
            else if playerCount == 2 {
                cpu2 = Player(cardsRemaining: 4, goldRemaining: goldAtStart, person: false)
                playerList.append(cpu2)
            }
            else if playerCount == 3 {
                cpu3 = Player(cardsRemaining: 4, goldRemaining: goldAtStart, person: false)
                playerList.append(cpu3)
            }
        }
    }*/
    
    func cardPlayable (cardPlayed: Cards) -> Bool {
        
    }
}
