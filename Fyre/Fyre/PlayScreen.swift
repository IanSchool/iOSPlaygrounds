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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        if game!.numOfPlayersValue < 4 {
            cpu3Gold.text = ""
            cpu3Cards.text = ""
        }
        else if game!.numOfPlayersValue < 3 {
            cpu2Gold.text = ""
            cpu2Cards.text = ""
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
