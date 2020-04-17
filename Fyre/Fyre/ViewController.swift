//
//  ViewController.swift
//  Fyre
//
//  Created by Ian Stedham on 4/8/20.
//  Copyright © 2020 Ian Stedham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Possible immediate crash
    @IBOutlet weak var startingGold: UITextField!
    @IBOutlet weak var numOfPlayers: UITextField!
    var numOfPlayersValue: Int
    var goldAtStart: Int
    var personPlayer: Player
    var cpu1: Player
    var cpu2: Player
    var cpu3: Player
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func startGame(_ sender: Any) {
        //numOfPlayersValue = Int(numOfPlayers.text!)
        //goldAtStart = Int(startingGold.text!)
        for playerCount in numOfPlayersValue - 1 {
            if playerCount == 0 {
                personPlayer = Player(cardsRemaining: 4, goldRemaining: goldAtStart, person: true)
            }
            else {
                //how to access cpu num from text?
            }
        }
    }
    
    //Does everythig have to be within Start Button?


}

