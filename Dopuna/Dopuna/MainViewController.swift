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
        
        insertContact.layer.borderColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1).cgColor
        insertContact.layer.borderWidth = CGFloat(1.0)
        insertContact.layer.cornerRadius = 6
        insertContact.titleLabel?.textAlignment = NSTextAlignment.center
        
        mreza.layer.borderColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1).cgColor
        mreza.layer.borderWidth = CGFloat(1.0)
        mreza.layer.cornerRadius = 8
        
        iznos.layer.borderColor = UIColor(red: 208/255, green: 208/255, blue: 208/255, alpha: 1).cgColor
        iznos.layer.borderWidth = CGFloat(1.0)
        iznos.layer.cornerRadius = 8
        
        dopuni.layer.borderColor = UIColor(red: 83/255, green: 219/255, blue: 207/255, alpha: 1).cgColor
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
    
   
    @IBAction func odaberiMrezu(_ sender: UISegmentedControl) {
        if mreza.selectedSegmentIndex == 0 {
          
            iznos.setTitle("2 KM", forSegmentAt: 0)
            iznos.setTitle("3 KM", forSegmentAt: 1)
            iznos.setTitle("4 KM", forSegmentAt: 2)
            iznos.setTitle("5 KM", forSegmentAt: 3)
            iznos.setTitle("10 KM", forSegmentAt: 4)
            
        }
        if mreza.selectedSegmentIndex == 1 {
            iznos.setTitle("1 KM", forSegmentAt: 0)
            iznos.setTitle("2 KM", forSegmentAt: 1)
            iznos.setTitle("5 KM", forSegmentAt: 2)
            iznos.setTitle("10 KM", forSegmentAt: 3)
            iznos.setTitle("20 KM", forSegmentAt: 4)
        }
    }
    
    
    func didPressCellWithTitle(_ contact: Contact) {
        if contact.name == "" {
            insertContact.titleLabel?.text = "+387" + contact.phoneNumber
        } else {
            insertContact.titleLabel?.text = contact.name
        }
        selectedPhoneNumber = contact.phoneNumber
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let contactTableViewController = segue.destination as? ContactTableViewController {
           contactTableViewController.delegate = self
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessage(_ sender: UIButton) {
        if !MFMessageComposeViewController.canSendText() {
            let alertController = UIAlertController(title: "Pažnja", message: "Ovaj uređaj ne može poslati poruku.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion:nil)
            } else {
            let composeVC = MFMessageComposeViewController()
            composeVC.delegate = self
            
            var iznosSplitted = iznos.titleForSegment(at: iznos.selectedSegmentIndex)?.components(separatedBy: " ")
           let odabraniIznos = iznosSplitted! [0]

            if mreza.selectedSegmentIndex == 0 {
                composeVC.recipients = ["0651110"]
                composeVC.body = "D" + odabraniIznos + " 387" + selectedPhoneNumber
            } else {
                composeVC.recipients = ["0611171"]

                composeVC.body = odabraniIznos + " 387" + selectedPhoneNumber
            }
            
            self.present(composeVC, animated: true, completion: nil)
        }
    }
    
}
