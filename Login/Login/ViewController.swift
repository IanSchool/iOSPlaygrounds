//
//  ViewController.swift
//  Login
//
//  Created by Ian on 2/21/20.
//  Copyright © 2020 Ian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        if sender == forgotUserNameButton {
            segue.destination.navigationItem.title = "Forgot Unsername"
        }
        else if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        }
        else {
            segue.destination.navigationItem.title = userName.text
        }
    }
    
    @IBAction func forgotUserName(_ sender: Any) {
        performSegue(withIdentifier: "nonButtonSegue", sender: forgotUserNameButton)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "nonButtonSegue", sender: forgotPasswordButton)
    }
}

