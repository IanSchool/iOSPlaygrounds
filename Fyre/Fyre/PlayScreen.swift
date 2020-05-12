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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func currentCardTapped(_ sender: Any) {
        print(currentCard.image?.accessibilityIdentifier)
    }
    
    @IBAction func card1Tapped(_ sender: Any){
        print(card1.image?.accessibilityIdentifier)
    }
    
    @IBAction func card2Tapped(_ sender: Any) {
    }
    
   
    @IBAction func card3Tapped(_ sender: Any) {
        
    }
    
    @IBAction func card4Tapped(_ sender: Any) {
        
    }
    
    @IBAction func card5Tapped(_ sender: Any) {
        
    }
    
    @IBAction func card6Tapped(_ sender: Any) {
        
    }
    
    @IBAction func card7Tapped(_ sender: Any) {
        
    }
    
    @IBAction func card8Tapped(_ sender: Any) {
        
    }
    
    @IBAction func nextTurn(_ sender: Any) {
        if turnNum % game!.numOfPlayersValue == 1 {
            //click on card and do cardPlayable here
            //set currentCard to the card you played and remove it from your hand
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
}
