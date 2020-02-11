//
//  ViewController.swift
//  tempatureConverter
//
//  Created by Ian on 2/7/20.
//  Copyright © 2020 Ian. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var tempEntered: UITextField!
    @IBOutlet weak var convertResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //This lets you dismiss the keyboard by tapping outside of the keyboard
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }

    @IBAction func convertPressed(_ sender: Any) {
        let fahrenheit = tempEntered.text!
        if fahrenheit != ""{
            if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: fahrenheit)){
                var celsius = Double(fahrenheit)
                celsius = 5/9.0 * (celsius! - 32)
                convertResults.text = String(celsius!)
            }
        }
    }
}

