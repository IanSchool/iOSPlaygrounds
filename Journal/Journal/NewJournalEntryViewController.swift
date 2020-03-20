//
//  NewJournalEntryViewController.swift
//  Journal
//
//  Created by Ian Stedham on 3/18/20.
//  Copyright © 2020 Ian. All rights reserved.
//

import UIKit

class NewJournalEntryViewController: UIViewController {

    @IBOutlet weak var journalEntryContents: UITextView!
    var journal: Journal?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
