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
    
    @IBAction func startGame(_ sender: Any) {
        numOfPlayersValue = Int(numOfPlayers.text!)
        goldAtStart = Int(startingGold.text!)
    }


}

