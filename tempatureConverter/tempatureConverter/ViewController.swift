//
//  ViewController.swift
//  tempatureConverter
//
//  Created by Ian on 2/7/20.
//  Copyright © 2020 Ian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempEntered: UITextField!
    @IBOutlet weak var convertResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convertPressed(_ sender: Any) {
        let fahrenheit = Double(tempEntered.text!)
        let celsius = 5/9.0 * (fahrenheit! - 32)
        convertResults.text = String(celsius)
    }
    
}

