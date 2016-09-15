//
//  SpendTrackerTableViewController.swift
//  SpendTrackerApp
//
//  Created by Test on 07.09.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class SpendTrackerTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var spendings = [SpendTracker]()
   let dateComponents = NSDateComponents()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem()
        
        if let savedExpenses = loadExpenses() {
            spendings += savedExpenses
        } else {
            loadSamples()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    func loadSamples() {
        let spent1 = SpendTracker(amount: "240", descriptionOfTheExpense: "test", date: "3.3.2003")!
        spendings += [spent1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spendings.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "SpendTrackerTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SpendTrackerTableViewCell
        let spent = spendings[indexPath.row]
        
    
        cell.dateLabel.text = spent.date
        cell.amountLabel.text = spent.amount
        cell.descriptionLabel.text = spent.descriptionOfTheExpense
        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            spendings.removeAtIndex(indexPath.row)
            saveExpenses()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let expensesDetailViewController = segue.destinationViewController as! ViewController
            if let selectedExpenseCell = sender as? SpendTrackerTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedExpenseCell)!
                let selectedExpense = spendings[indexPath.row]
                expensesDetailViewController.spent = selectedExpense
            }
            
        } else if segue.identifier == "AddItem" {
            
        }
    }
    

    @IBAction func unwindToExpensesList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? ViewController, spent = sourceViewController.spent {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                spendings[selectedIndexPath.row] = spent
                    tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
            let newIndexPath = NSIndexPath(forRow: spendings.count, inSection: 0)
            spendings.append(spent)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            saveExpenses()
        }
    }
    
    func saveExpenses() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(spendings, toFile: SpendTracker.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
    }
    func loadExpenses() -> [SpendTracker]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(SpendTracker.ArchiveURL.path!) as? [SpendTracker]
    }
}
