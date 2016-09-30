//
//  MainViewController.swift
//  Dopuna
//
//  Created by Test on 27.09.2016..
//  Copyright © 2016. Merima & Ena. All rights reserved.
//

import UIKit
import MessageUI

class MainViewController: UIViewController, MFMessageComposeViewControllerDelegate, ContactTableViewDelegate, UINavigationControllerDelegate {

    var selectedPhoneNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        insertContact.layer.borderColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1).CGColor
        insertContact.layer.borderWidth = CGFloat(1.0)
        insertContact.layer.cornerRadius = 6
        insertContact.titleLabel?.textAlignment = NSTextAlignment.Center
        
        mreza.layer.borderColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1).CGColor
        mreza.layer.borderWidth = CGFloat(1.0)
        mreza.layer.cornerRadius = 8
        
        iznos.layer.borderColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1).CGColor
        iznos.layer.borderWidth = CGFloat(1.0)
        iznos.layer.cornerRadius = 8
        
        dopuni.layer.borderColor = UIColor(red: 83/255, green: 219/255, blue: 207/255, alpha: 1).CGColor
        dopuni.layer.borderWidth = CGFloat(1.0)
        dopuni.layer.cornerRadius = 6
        
    }
    
    
    // Outlets
    
    @IBOutlet weak var insertContact: UIButton!
    
    @IBOutlet weak var mreza: UISegmentedControl!
    
    @IBOutlet weak var iznos: UISegmentedControl!
    
    @IBOutlet weak var dopuni: UIButton!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // Actions
    
   
    @IBAction func odaberiMrezu(sender: UISegmentedControl) {
        if mreza.selectedSegmentIndex == 0 {
          
            iznos.setTitle("2 KM", forSegmentAtIndex: 0)
            iznos.setTitle("3 KM", forSegmentAtIndex: 1)
            iznos.setTitle("4 KM", forSegmentAtIndex: 2)
            iznos.setTitle("5 KM", forSegmentAtIndex: 3)
            iznos.setTitle("10 KM", forSegmentAtIndex: 4)
            
        }
        if mreza.selectedSegmentIndex == 1 {
            iznos.setTitle("1 KM", forSegmentAtIndex: 0)
            iznos.setTitle("2 KM", forSegmentAtIndex: 1)
            iznos.setTitle("5 KM", forSegmentAtIndex: 2)
            iznos.setTitle("10 KM", forSegmentAtIndex: 3)
            iznos.setTitle("20 KM", forSegmentAtIndex: 4)
        }
    }
    
    
    func didPressCellWithTitle(contact: Contact) {
        if contact.name == "" {
            insertContact.titleLabel?.text = "+387" + contact.phoneNumber
        } else {
            insertContact.titleLabel?.text = contact.name
        }
        selectedPhoneNumber = contact.phoneNumber
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let contactTableViewController = segue.destinationViewController as? ContactTableViewController {
           contactTableViewController.delegate = self
        }
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func sendMessage(sender: UIButton) {
        if !MFMessageComposeViewController.canSendText() {
            let alertController = UIAlertController(title: "Pažnja", message: "Ovaj uređaj ne može poslati poruku.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion:nil)
            } else {
            let composeVC = MFMessageComposeViewController()
            composeVC.delegate = self
            
            var iznosSplitted = iznos.titleForSegmentAtIndex(iznos.selectedSegmentIndex)?.componentsSeparatedByString(" ")
           let odabraniIznos = iznosSplitted! [0]

            if mreza.selectedSegmentIndex == 0 {
                composeVC.recipients = ["0651110"]
                composeVC.body = "D" + odabraniIznos + " 387" + selectedPhoneNumber
            } else {
                composeVC.recipients = ["0611171"]

                composeVC.body = odabraniIznos + " 387" + selectedPhoneNumber
            }
            
            self.presentViewController(composeVC, animated: true, completion: nil)
        }
    }
    
}