//
//  ViewController.swift
//  Fyre
//
//  Created by Ian Stedham on 4/8/20.
//  Copyright © 2020 Ian Stedham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startingGold: UITextField!
    @IBOutlet weak var numOfPlayers: UITextField!
    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    @IBOutlet weak var card4: UIImageView!
    @IBOutlet weak var card5: UIImageView!
    @IBOutlet weak var card6: UIImageView!
    @IBOutlet weak var card7: UIImageView!
    @IBOutlet weak var card8: UIImageView!
    var numOfPlayersValue: Int?
    var goldAtStart: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startGame(_ sender: Any) {
        numOfPlayersValue = Int(numOfPlayers.text!)
        goldAtStart = Int(startingGold.text!)
        var game = Game()
        game.start(playerCount: numOfPlayersValue!, startingGold: goldAtStart!)
        card1.image = UIImage(named: game.personPlayer.cardsInHand[0].cardName)
        
        performSegue(withIdentifier: "startGame", sender: nil)
        
    }


}

