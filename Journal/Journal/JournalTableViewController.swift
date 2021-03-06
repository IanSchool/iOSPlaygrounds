//
//  JournalTableViewController.swift
//  Journal
//
//  Created by Ian on 3/5/20.
//  Copyright © 2020 Ian. All rights reserved.
//

import UIKit

class JournalTableViewController: UITableViewController {

    let cellReuseIdentifier = "JournalEntryCell"
    var journal = Journal()
    let journalEntrySegueIdentifier = "journalEntry"
    let newJournalSegueIdentifier = "newJournalEntry"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0...3 {
            journal.entries.append(JournalEntry(date: Date(), contents: "Contents for entry \(index)"))
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journal.entries.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        if let label = cell.textLabel {
            let entry = journal.entry(index: indexPath.row)
            label.text = "\(entry!)"
        }
        return cell
    }

    @IBAction func done(segue: UIStoryboardSegue) {
        let newJournalEntry = segue.source as! NewJournalEntryViewController
        journal.entries.append(JournalEntry(date: Date(), contents: newJournalEntry.journalEntryContents.text))
        tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let journalEntryViewController = segue.destination as? JournalEntryViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = self.tableView.indexPath(for: cell),
            let entry = journal.entry(index: indexPath.row) {
            journalEntryViewController.journalEntry = entry
        }
        else if segue.identifier == newJournalSegueIdentifier {
            if let newJournalEntryViewController =
                segue.destination as? NewJournalEntryViewController {
                newJournalEntryViewController.journal = journal
            }
        }
    }
}
