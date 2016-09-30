//
//  ContactTableViewController.swift
//  Dopuna
//
//  Created by Merima on 9/21/16.
//  Copyright © 2016 Merima & Ena. All rights reserved.
//

import UIKit

protocol ContactTableViewDelegate {
    func didPressCellWithTitle (contact: Contact)
}

class ContactTableViewController: UITableViewController {
    // MARK: Properties
    
    var delegate: ContactTableViewDelegate?
    var contacts = [Contact]()
    var selectedContact: Contact? {
        didSet {
            if let contact = selectedContact {
                selectedContactIndex = contacts.indexOf(contact)!
            }
        }
    }
    var selectedContactIndex: Int?

    @IBOutlet weak var selectedContactCell: ContactTableViewCell!
    @IBOutlet weak var editContactButton: UIBarButtonItem!
   /* @IBOutlet weak var editContactButton: UIBarButtonItem! */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedContacts = loadContacts() {
            contacts += savedContacts
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ContactTableViewCell
        let contact = contacts[indexPath.row]
       
        cell.contactNameLabel.text = contact.name
        cell.contactNumberLabel.text = "+387" + contact.phoneNumber
        
        if cell.contactNameLabel.text == "" {
            cell.contactNameLabel.text = cell.contactNumberLabel.text
            cell.contactNumberLabel.text = ""
            }
        
        cell.contactNumberLabel.textColor = UIColor.grayColor()
        cell.contactNameLabel.textColor = UIColor(red:33/255, green: 129/255, blue: 112/255, alpha: 1)
       
        
        if indexPath.row == selectedContactIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
      
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if let index = selectedContactIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedContact = contacts[indexPath.row]
        
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
        //  Ovdje prosliijedi kontakt
        delegate?.didPressCellWithTitle((selectedContact)!)
        
        _ = self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 


    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            contacts.removeAtIndex(indexPath.row)
            saveContacts()
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
            let contactDetailViewController = segue.destinationViewController as! ViewController
            // Get the cell that generated this segue.
            if let selectedContactCell = sender as? ContactTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedContactCell)!
                let selectedContact = contacts[indexPath.row]
                contactDetailViewController.contact = selectedContact
            }
        }
    }
 // MARK: Action
    
    
    @IBAction func editContact(sender: UIBarButtonItem) {
        if (self.tableView.editing) {
            editContactButton.title = "Trash"
            self.tableView.setEditing(false, animated: true)
        } else {
            editContactButton.title = "Done"
            self.tableView.setEditing(true, animated: true)
        }    }
  
    
    @IBAction func unwindToContactList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? ViewController, contact = sourceViewController.contact {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing contact.
                contacts[selectedIndexPath.row] = contact
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else {
                // Add a new contact.
                let newIndexPath = NSIndexPath(forRow: contacts.count, inSection: 0)
                contacts.append(contact)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
                
            }
            saveContacts()
        }
    }
    func saveContacts () {
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(contacts, toFile: Contact.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save contacts...")
        }
    }
    
    func loadContacts() -> [Contact]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Contact.ArchiveURL.path!) as? [Contact]
    }
}