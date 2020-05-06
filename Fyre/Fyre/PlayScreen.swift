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
    
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(game?.numOfPlayersValue)
        // Do any additional setup after loading the view.
    }
}
