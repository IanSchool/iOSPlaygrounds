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
    
    var game: Game?
    var turnNum = 0
    let suits = ["H", "C", "S", "D"]
    var cardPlayedName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    @IBAction func currentCardTapped(sender: UITapGestureRecognizer) {
        
    }
    
    @IBAction func card1Tapped(sender: UITapGestureRecognizer){
        if cardPlayable(card: card1) {
            currentCard.image = card1.image
            game!.cardInPlay = game!.personPlayer.cardsInHand[0]
            game!.personPlayer.cardsInHand.remove(at: 0)
        }
    }
    
    @IBAction func card2Tapped(sender: UITapGestureRecognizer) {
        
    }
    
    @IBAction func card3Tapped(sender: UITapGestureRecognizer) {
        
    }
    
    @IBAction func card4Tapped(sender: UITapGestureRecognizer) {
        
    }
    
    @IBAction func card5Tapped(sender: UITapGestureRecognizer) {
        
    }
    
    @IBAction func card6Tapped(sender: UITapGestureRecognizer) {
        print("hello world 6")
    }
    
    @IBAction func card7Tapped(sender: UITapGestureRecognizer) {
        print("hello world 7")
    }
    
    @IBAction func card8Tapped(sender: UITapGestureRecognizer) {
        print("hello world 8")
    }
    
    @IBAction func nextTurn(_ sender: Any) {
        if turnNum % game!.numOfPlayersValue == 1 {
            //updateUI()
            //need to figure out where the raising or folding goes (need buttons for them)
        }
        else {
            //choose card that works for them and use it
            //if none work add card to their hand (probably wont happen ever)
        }
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
    }
    
    func cardPlayable(card: UIImageView) -> Bool {
        for number in 1...13 {
            for s in suits {
                cardPlayedName = "\(number)\(s)"
                if UIImage(named: cardPlayedName) == card.image {
                    for num in 1...13 {
                        if UIImage(named: "\(num)\(s)") == currentCard.image {
                            return true
                        }
                    }
                    for s2 in suits {
                        if UIImage(named: "\(number)\(s2)") == currentCard.image {
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
}
