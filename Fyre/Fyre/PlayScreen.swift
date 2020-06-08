//
//  PlayScreen.swift
//  Fyre
//
//  Created by Ian Stedham on 5/5/20.
//  Copyright © 2020 Ian Stedham. All rights reserved.
//

import Foundation
import UIKit

class PlayScreen: UIViewController {
    @IBOutlet weak var currentCard: UIImageView!
    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    @IBOutlet weak var card4: UIImageView!
    @IBOutlet weak var card5: UIImageView!
    @IBOutlet weak var card6: UIImageView!
    @IBOutlet weak var card7: UIImageView!
    @IBOutlet weak var card8: UIImageView!
    @IBOutlet weak var yourGold: UILabel!
    @IBOutlet weak var cpu1Cards: UILabel!
    @IBOutlet weak var cpu1Gold: UILabel!
    @IBOutlet weak var cpu2Cards: UILabel!
    @IBOutlet weak var cpu2Gold: UILabel!
    @IBOutlet weak var cpu3Cards: UILabel!
    @IBOutlet weak var cpu3Gold: UILabel!
    @IBOutlet var raiseButtons: [UIButton]!
    @IBOutlet weak var currentPot: UILabel!
    @IBOutlet weak var yourTurn: UILabel!
    @IBOutlet weak var raiseActual: UIButton!
    @IBOutlet weak var foldButton: UIButton!
    @IBOutlet weak var nextTurnButton: UIButton!
    
    var game: Game?
    var turnNum = 0
    let suits = ["H", "C", "S", "D"]
    var cardPlayedName: String = ""
    var playerTurn = true
    var playerFold = false
    var cpu1Fold = false
    var cpu2Fold = false
    var cpu3Fold = false
    var raisedAmount = 0
    var numPlayersFolded = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func card1Tapped(sender: UITapGestureRecognizer){
        if playerTurn {
            if cardPlayable(card: game!.personPlayer.cardsInHand[0]) {
                game!.cardInPlay = game!.personPlayer.cardsInHand[0]
                game!.personPlayer.cardsInHand.remove(at: 0)
                updateUI()
            }
        }
    }
    
    @IBAction func card2Tapped(sender: UITapGestureRecognizer) {
        if playerTurn {
            if cardPlayable(card: game!.personPlayer.cardsInHand[1]) {
                game!.cardInPlay = game!.personPlayer.cardsInHand[1]
                game!.personPlayer.cardsInHand.remove(at: 1)
                updateUI()
            }
        }
    }
    
    @IBAction func card3Tapped(sender: UITapGestureRecognizer) {
        if playerTurn {
            if cardPlayable(card: game!.personPlayer.cardsInHand[2]) {
                game!.cardInPlay = game!.personPlayer.cardsInHand[2]
                game!.personPlayer.cardsInHand.remove(at: 2)
                updateUI()
            }
        }
    }
    
    @IBAction func card4Tapped(sender: UITapGestureRecognizer) {
        if playerTurn {
            if cardPlayable(card: game!.personPlayer.cardsInHand[3]) {
                game!.cardInPlay = game!.personPlayer.cardsInHand[3]
                game!.personPlayer.cardsInHand.remove(at: 3)
                updateUI()
            }
        }
    }
    
    @IBAction func card5Tapped(sender: UITapGestureRecognizer) {
        if playerTurn {
            if cardPlayable(card: game!.personPlayer.cardsInHand[4]) {
                game!.cardInPlay = game!.personPlayer.cardsInHand[4]
                game!.personPlayer.cardsInHand.remove(at: 4)
                updateUI()
            }
        }
    }
    
    @IBAction func card6Tapped(sender: UITapGestureRecognizer) {
        if playerTurn {
            if cardPlayable(card: game!.personPlayer.cardsInHand[5]) {
                game!.cardInPlay = game!.personPlayer.cardsInHand[5]
                game!.personPlayer.cardsInHand.remove(at: 5)
                updateUI()
            }
        }
    }
    
    @IBAction func card7Tapped(sender: UITapGestureRecognizer) {
        if playerTurn {
            if cardPlayable(card: game!.personPlayer.cardsInHand[6]) {
                game!.cardInPlay = game!.personPlayer.cardsInHand[6]
                game!.personPlayer.cardsInHand.remove(at: 6)
                updateUI()
            }
        }
    }
    
    @IBAction func card8Tapped(sender: UITapGestureRecognizer) {
        if playerTurn {
            if cardPlayable(card: game!.personPlayer.cardsInHand[7]) {
                game!.cardInPlay = game!.personPlayer.cardsInHand[7]
                game!.personPlayer.cardsInHand.remove(at: 7)
                updateUI()
            }
        }
    }
    
    @IBAction func fold(_ sender: Any) {
        if playerTurn {
            game!.personPlayer.fold()
            playerFold = true
            playerTurn = false
            numPlayersFolded += 1
            updateUI()
        }
        cpuRaising()
        raiseActual.isEnabled = false
        foldButton.isEnabled = false
    }
    
    @IBAction func raise(_ sender: Any) {
        if playerTurn {
            for button in raiseButtons {
                button.isEnabled = true
            }
        }
    }
    
    @IBAction func oneFourthRaise(_ sender: Any) {
        raisedAmount = game!.personPlayer.raise(amount: 0.25)
        game!.currentPot += game!.personPlayer.raise(amount: 0.25)
        game!.personPlayer.goldRemaining -= game!.personPlayer.raise(amount: 0.25)
        for button in raiseButtons {
            button.isEnabled = false
        }
        raiseActual.isEnabled = false
        foldButton.isEnabled = false
        
        cpuRaising()
        updateUI()
    }
    
    @IBAction func oneThirdRaise(_ sender: Any) {
        raisedAmount = game!.personPlayer.raise(amount: 1/3)
        game!.currentPot += game!.personPlayer.raise(amount: 1/3)
        game!.personPlayer.goldRemaining -= game!.personPlayer.raise(amount: 1/3)
        for button in raiseButtons {
            button.isEnabled = false
        }
        raiseActual.isEnabled = false
        foldButton.isEnabled = false
        
        cpuRaising()
        updateUI()
    }
    
    @IBAction func oneHalfRaise(_ sender: Any) {
        raisedAmount = game!.personPlayer.raise(amount: 0.5)
        game!.currentPot += game!.personPlayer.raise(amount: 0.5)
        game!.personPlayer.goldRemaining -= game!.personPlayer.raise(amount: 0.5)
        for button in raiseButtons {
            button.isEnabled = false
        }
        raiseActual.isEnabled = false
        foldButton.isEnabled = false
        
        cpuRaising()
        updateUI()
    }
    
    @IBAction func allInRaise(_ sender: Any) {
        raisedAmount = game!.personPlayer.raise(amount: 1)
        game!.currentPot += game!.personPlayer.raise(amount: 1)
        game!.personPlayer.goldRemaining -= game!.personPlayer.raise(amount: 1)
        for button in raiseButtons {
            button.isEnabled = false
        }
        raiseActual.isEnabled = false
        foldButton.isEnabled = false
        
        cpuRaising()
        updateUI()
    }
    
    func cpuRaising() {
        if raisedAmount == 0 || playerFold {
            raisedAmount = game!.cpu1.goldRemaining / 4
        }
        
        if !cpu1Fold && game!.cpu1.goldRemaining >= raisedAmount {
            var cpu1Played = false
            for num in 0...game!.cpu1.cardsInHand.count - 1 {
                if cardPlayable(card: game!.cpu1.cardsInHand[num]) {
                    game!.cpu1.goldRemaining -= raisedAmount
                    game!.currentPot += raisedAmount
                    cpu1Played = true
                    break
                }
            }
            
            if !cpu1Played {
                game!.cpu1.fold()
                cpu1Fold = true
                numPlayersFolded += 1
            }
        }
        else {
            game!.cpu1.fold()
            cpu1Fold = true
            numPlayersFolded += 1
        }
        
        if game!.numOfPlayersValue > 3 {
            if !cpu2Fold && game!.cpu2.goldRemaining >= raisedAmount {
                var cpu2Played = false
                for num in 0...game!.cpu2.cardsInHand.count - 1 {
                    if cardPlayable(card: game!.cpu2.cardsInHand[num]) {
                        game!.cpu2.goldRemaining -= raisedAmount
                        game!.currentPot += raisedAmount
                        cpu2Played = true
                        break
                    }
                }
                
                if !cpu2Played {
                    game!.cpu2.fold()
                    cpu2Fold = true
                    numPlayersFolded += 1
                }
            }
            else {
                game!.cpu2.fold()
                cpu2Fold = true
                numPlayersFolded += 1
            }
            
            if !cpu3Fold && game!.cpu3.goldRemaining >= raisedAmount {
                var cpu3Played = false
                for num in 0...game!.cpu3.cardsInHand.count - 1 {
                    if cardPlayable(card: game!.cpu3.cardsInHand[num]) {
                        game!.cpu3.goldRemaining -= raisedAmount
                        game!.currentPot += raisedAmount
                        cpu3Played = true
                        break
                    }
                }
                
                if !cpu3Played {
                    game!.cpu3.fold()
                    cpu3Fold = true
                    numPlayersFolded += 1
                }
            }
            else {
                game!.cpu3.fold()
                cpu3Fold = true
                numPlayersFolded += 1
            }
        }
        else if game!.numOfPlayersValue > 2 {
            if !cpu2Fold && game!.cpu2.goldRemaining >= raisedAmount {
                var cpu2Played = false
                for num in 0...game!.cpu2.cardsInHand.count - 1 {
                    if cardPlayable(card: game!.cpu2.cardsInHand[num]) {
                        game!.cpu2.goldRemaining -= raisedAmount
                        game!.currentPot += raisedAmount
                        cpu2Played = true
                        break
                    }
                }
                
                if !cpu2Played {
                    game!.cpu2.fold()
                    cpu2Fold = true
                    numPlayersFolded += 1
                }
            }
            else {
                game!.cpu2.fold()
                cpu2Fold = true
                numPlayersFolded += 1
            }
        }
    }
    
    @IBAction func nextTurn(_ sender: Any) {
        nextTurnButton.setTitle("Next Turn", for: .normal)
        turnNum += 1
        
        if turnNum > game!.numOfPlayersValue {
            turnNum = 1
        }
        
        if turnNum == 1 {
            if !playerFold {
                raiseActual.isEnabled = true
                foldButton.isEnabled = true
                playerTurn = true
                yourTurn.text = "It is your turn"
            }
        }
        else if turnNum == 2 {
            playerTurn = false
            var cpu1CardPlayed = false
            if !cpu1Fold {
                for num in 0...game!.cpu1.cardsInHand.count - 1 {
                    if cardPlayable(card: game!.cpu1.cardsInHand[num]) {
                        game!.cardInPlay = game!.cpu1.cardsInHand[num]
                        game!.cpu1.cardsInHand.remove(at: num)
                        updateUI()
                        cpu1CardPlayed = true
                        break
                    }
                }
                
                if !cpu1CardPlayed {
                    game!.cpu1.fold()
                    cpu1Fold = true
                    numPlayersFolded += 1
                }
                yourTurn.text = ""
            }
        }
        else if turnNum == 3 {
            playerTurn = false
            var cpu2CardPlayed = false
            if !cpu2Fold {
                for num in 0...game!.cpu2.cardsInHand.count - 1 {
                    if cardPlayable(card: game!.cpu2.cardsInHand[num]) {
                        game!.cardInPlay = game!.cpu2.cardsInHand[num]
                        game!.cpu2.cardsInHand.remove(at: num)
                        updateUI()
                        cpu2CardPlayed = true
                        break
                    }
                }
                
                if !cpu2CardPlayed {
                    game!.cpu2.fold()
                    cpu2Fold = true
                    numPlayersFolded += 1
                }
                yourTurn.text = ""
            }
        }
        else if turnNum == 4 {
            playerTurn = false
            var cpu3CardPlayed = false
            if !cpu3Fold {
                for num in 0...game!.cpu3.cardsInHand.count - 1 {
                    if cardPlayable(card: game!.cpu3.cardsInHand[num]) {
                        game!.cardInPlay = game!.cpu3.cardsInHand[num]
                        game!.cpu3.cardsInHand.remove(at: num)
                        updateUI()
                        cpu3CardPlayed = true
                        break
                    }
                }
                
                if !cpu3CardPlayed {
                    game!.cpu3.fold()
                    cpu3Fold = true
                    numPlayersFolded += 1
                }
                yourTurn.text = ""
            }
        }
        
        if winner() {
            if numPlayersFolded + 1 == game!.numOfPlayersValue {
                if game!.numOfPlayersValue == 2 {
                    if playerFold {
                        game!.cpu1.goldRemaining += game!.currentPot
                        game!.currentPot = 0
                    }
                    else {
                        game!.personPlayer.goldRemaining += game!.currentPot
                        game!.currentPot = 0
                    }
                }
                else if game!.numOfPlayersValue == 3 {
                    if playerFold && cpu1Fold {
                        game!.cpu2.goldRemaining += game!.currentPot
                        game!.currentPot = 0
                    }
                    else if playerFold && cpu2Fold {
                        game!.cpu1.goldRemaining += game!.currentPot
                        game!.currentPot = 0
                    }
                    else {
                        game!.personPlayer.goldRemaining += game!.currentPot
                        game!.currentPot = 0
                    }
                }
                else if game!.numOfPlayersValue == 4 {
                    if playerFold && cpu2Fold && cpu3Fold {
                        game!.cpu1.goldRemaining += game!.currentPot
                        game!.currentPot = 0
                    }
                    else if playerFold && cpu1Fold && cpu3Fold{
                        game!.cpu2.goldRemaining += game!.currentPot
                        game!.currentPot = 0
                    }
                    else if playerFold && cpu1Fold && cpu2Fold{
                        game!.cpu3.goldRemaining += game!.currentPot
                        game!.currentPot = 0
                    }
                    else {
                        game!.personPlayer.goldRemaining += game!.currentPot
                        game!.currentPot = 0
                    }
                }
            }
            else if game!.personPlayer.cardsInHand.count == 0 && !playerFold {
                game!.personPlayer.goldRemaining += game!.currentPot
                game!.currentPot = 0
            }
            else if game!.cpu1.cardsInHand.count == 0 && !cpu1Fold {
                game!.cpu1.goldRemaining += game!.currentPot
                game!.currentPot = 0
            }
            else if game!.cpu2.cardsInHand.count == 0 && !cpu2Fold && game!.numOfPlayersValue > 2 {
                game!.cpu2.goldRemaining += game!.currentPot
                game!.currentPot = 0
            }
            else if game!.cpu3.cardsInHand.count == 0 && !cpu3Fold && game!.numOfPlayersValue > 3 {
                game!.cpu3.goldRemaining += game!.currentPot
                game!.currentPot = 0
            }
            
            turnNum = 1
            playerFold = false
            cpu1Fold = false
            cpu2Fold = false
            cpu3Fold = false
            numPlayersFolded = 0
            game!.reset()
        }
        
        updateUI()
    }
    
    func updateUI() {
        currentCard.image = UIImage(named: game!.cardInPlay.cardName)
        if game!.numOfPlayersValue == 2 {
            cpu2Gold.text = ""
            cpu2Cards.text = ""
            cpu3Gold.text = ""
            cpu3Cards.text = ""
            
            cpu1Gold.text = "Gold: \(game!.cpu1.goldRemaining)"
            cpu1Cards.text = "Cards: \(game!.cpu1.cardsInHand.count)"
        }
        else if game!.numOfPlayersValue == 3 {
            cpu3Gold.text = ""
            cpu3Cards.text = ""
            
            cpu1Gold.text = "Gold: \(game!.cpu1.goldRemaining)"
            cpu1Cards.text = "Cards: \(game!.cpu1.cardsInHand.count)"
            cpu2Gold.text = "Gold: \(game!.cpu2.goldRemaining)"
            cpu2Cards.text = "Cards: \(game!.cpu2.cardsInHand.count)"
        }
        else if game!.numOfPlayersValue == 4 {
            cpu1Gold.text = "Gold: \(game!.cpu1.goldRemaining)"
            cpu1Cards.text = "Cards: \(game!.cpu1.cardsInHand.count)"
            cpu2Gold.text = "Gold: \(game!.cpu2.goldRemaining)"
            cpu2Cards.text = "Cards: \(game!.cpu2.cardsInHand.count)"
            cpu3Gold.text = "Gold: \(game!.cpu3.goldRemaining)"
            cpu3Cards.text = "Cards: \(game!.cpu3.cardsInHand.count)"
        }
        
        card1.image = nil
        card2.image = nil
        card3.image = nil
        card4.image = nil
        card5.image = nil
        card6.image = nil
        card7.image = nil
        card8.image = nil
        
        yourGold.text = "Your Gold: \(game!.personPlayer.goldRemaining)"
        let playerCardCount = game!.personPlayer.cardsInHand.count
        if !playerFold {
            for num in 1...playerCardCount {
                if num == 1 {
                    card1.image = UIImage(named: game!.personPlayer.cardsInHand[0].cardName)
                }
                else if num == 2 {
                    card2.image = UIImage(named: game!.personPlayer.cardsInHand[1].cardName)
                }
                else if num == 3 {
                    card3.image = UIImage(named: game!.personPlayer.cardsInHand[2].cardName)
                }
                else if num == 4 {
                    card4.image = UIImage(named: game!.personPlayer.cardsInHand[3].cardName)
                }
                else if num == 5 {
                    card5.image = UIImage(named: game!.personPlayer.cardsInHand[4].cardName)
                }
                else if num == 6 {
                    card6.image = UIImage(named: game!.personPlayer.cardsInHand[5].cardName)
                }
                else if num == 7 {
                    card7.image = UIImage(named: game!.personPlayer.cardsInHand[6].cardName)
                }
                else if num == 8 {
                    card8.image = UIImage(named: game!.personPlayer.cardsInHand[7].cardName)
                }
            }
        }        
        currentPot.text = "Current Pot: \(game!.currentPot)"
    }
    
    func cardPlayable(card: Card) -> Bool {
        if game!.cardInPlay.cardType == card.cardType {
            return true
        }
        else if game!.cardInPlay.cardNum == card.cardNum {
            return true
        }
        return false
    }
    
    func winner() -> Bool{
        if numPlayersFolded + 1 == game!.numOfPlayersValue {
            return true
        }
        else if game!.personPlayer.cardsInHand.count == 0 && !playerFold {
            return true
        }
        else if game!.cpu1.cardsInHand.count == 0 && !cpu1Fold {
            return true
        }
        else if game!.cpu2.cardsInHand.count == 0 && !cpu2Fold && game!.numOfPlayersValue > 2 {
            return true
        }
        else if game!.cpu3.cardsInHand.count == 0 && !cpu3Fold && game!.numOfPlayersValue > 3 {
            return true
        }
        return false
    }
}
