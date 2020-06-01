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
    
    var game: Game?
    var turnNum = 1
    let suits = ["H", "C", "S", "D"]
    var cardPlayedName: String = ""
    var playerTurn = true
    var playerFold = false
    var cpu1Fold = false
    var cpu2Fold = false
    var cpu3Fold = false
    var raisedAmount = 0
    
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
            
            playerFold = false
            playerTurn = false
        }
    }
    
    @IBAction func raise(_ sender: Any) {
        if playerTurn {
            for button in raiseButtons {
                button.isEnabled = true
            }
        }
    }
    
    @IBAction func oneFourthRaise(_ sender: Any) {
        game!.currentPot += game!.personPlayer.raise(amount: 0.25)
        raisedAmount = game!.personPlayer.raise(amount: 0.25)
        for button in raiseButtons {
            button.isEnabled = false
        }
        updateUI()
    }
    
    @IBAction func oneThirdRaise(_ sender: Any) {
        game!.currentPot += game!.personPlayer.raise(amount: 1/3)
        raisedAmount = game!.personPlayer.raise(amount: 1/3)
        for button in raiseButtons {
            button.isEnabled = false
        }
        updateUI()
    }
    
    @IBAction func oneHalfRaise(_ sender: Any) {
        game!.currentPot += game!.personPlayer.raise(amount: 0.5)
        raisedAmount = game!.personPlayer.raise(amount: 0.5)
        for button in raiseButtons {
            button.isEnabled = false
        }
        updateUI()
    }
    
    @IBAction func allInRaise(_ sender: Any) {
        game!.currentPot += game!.personPlayer.raise(amount: 1)
        raisedAmount = game!.personPlayer.raise(amount: 1)
        for button in raiseButtons {
            button.isEnabled = false
        }
        updateUI()
    }
    
    @IBAction func nextTurn(_ sender: Any) {
        turnNum += 1
        
        if turnNum > game!.numOfPlayersValue {
            turnNum = 1
        }
        
        if turnNum == 1 {
            if !playerFold {
                playerTurn = true
                yourTurn.text = "It is your turn"
            }
        }
        else if turnNum == 2 {
            if !cpu1Fold {
                playerTurn = false
                if game!.cpu1.goldRemaining >= raisedAmount {
                    for num in 0...game!.cpu1.cardsInHand.count - 1 {
                        if cardPlayable(card: game!.cpu1.cardsInHand[num]) {
                            game!.cpu1.goldRemaining -= raisedAmount
                            game!.currentPot += raisedAmount
                            game!.cardInPlay = game!.cpu1.cardsInHand[num]
                            game!.cpu1.cardsInHand.remove(at: num)
                            updateUI()
                            break
                        }
                    }
                    game!.cpu1.fold()
                }
                else {
                    game!.cpu1.fold()
                }
                yourTurn.text = ""
            }
        }
        else if turnNum == 3 {
            playerTurn = false
            if !cpu2Fold {
                playerTurn = false
                if game!.cpu2.goldRemaining >= raisedAmount {
                    for num in 0...game!.cpu2.cardsInHand.count - 1 {
                        if cardPlayable(card: game!.cpu2.cardsInHand[num]) {
                            game!.cpu1.goldRemaining -= raisedAmount
                            game!.currentPot += raisedAmount
                            game!.cardInPlay = game!.cpu2.cardsInHand[num]
                            game!.cpu2.cardsInHand.remove(at: num)
                            updateUI()
                            break
                        }
                    }
                    game!.cpu2.fold()
                }
                else {
                    game!.cpu2.fold()
                }
                yourTurn.text = ""
            }
        }
        else if turnNum == 4 {
            playerTurn = false
            if !cpu3Fold {
                playerTurn = false
                if game!.cpu3.goldRemaining >= raisedAmount {
                    for num in 0...game!.cpu3.cardsInHand.count - 1 {
                        if cardPlayable(card: game!.cpu3.cardsInHand[num]) {
                            game!.cpu1.goldRemaining -= raisedAmount
                            game!.currentPot += raisedAmount
                            game!.cardInPlay = game!.cpu3.cardsInHand[num]
                            game!.cpu3.cardsInHand.remove(at: num)
                            updateUI()
                            break
                        }
                    }
                    game!.cpu3.fold()
                }
                else {
                    game!.cpu3.fold()
                }
                yourTurn.text = ""
            }
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
            cpu2Gold.text = "Gold: \(game!.cpu1.goldRemaining)"
            cpu2Cards.text = "Cards: \(game!.cpu1.cardsInHand.count)"
        }
        else if game!.numOfPlayersValue == 4 {
            cpu1Gold.text = "Gold: \(game!.cpu1.goldRemaining)"
            cpu1Cards.text = "Cards: \(game!.cpu1.cardsInHand.count)"
            cpu2Gold.text = "Gold: \(game!.cpu1.goldRemaining)"
            cpu2Cards.text = "Cards: \(game!.cpu1.cardsInHand.count)"
            cpu3Gold.text = "Gold: \(game!.cpu1.goldRemaining)"
            cpu3Cards.text = "Cards: \(game!.cpu1.cardsInHand.count)"
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
}
