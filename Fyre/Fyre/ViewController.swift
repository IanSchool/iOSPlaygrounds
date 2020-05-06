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
    
    var numOfPlayersValue: Int?
    var goldAtStart: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference of the next view controller
        // Make new instance of Game
        let newGame = Game(playerCount: numOfPlayersValue!, startingGold: goldAtStart!)
        let destinationVC = segue.destination as? PlayScreen
        destinationVC?.game = newGame
        
        //card1.image = UIImage(named: game.personPlayer.cardsInHand[0].cardName)
    }
    
    @IBAction func startGame(_ sender: Any) {
        numOfPlayersValue = Int(numOfPlayers.text!)
        goldAtStart = Int(startingGold.text!)
        
        performSegue(withIdentifier: "startGame", sender: nil)
    }
}

