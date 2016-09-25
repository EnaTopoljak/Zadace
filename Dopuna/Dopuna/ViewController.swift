//
//  ViewController.swift
//  Dopuna
//
//  Created by Test on 21.09.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    // OUTLETS
    
    @IBOutlet weak var contactImage: UIImageView!
    
    @IBOutlet weak var contactName: UITextField!
    
    @IBOutlet weak var numberImage: UIImageView!
    
    @IBOutlet weak var stateNumber: UILabel!

    @IBOutlet weak var contactNumber: UITextField!
 
    @IBOutlet weak var addNewContact: UIBarButtonItem!
    
    @IBOutlet weak var addNewContactButton: UIButton!
    
    
    var contact: Contact?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        contactName.delegate = self
        contactNumber.delegate = self
        
        contactName.layer.borderColor = UIColor(red: 83/255, green: 219/255, blue: 207/255, alpha: 1).CGColor
        contactName.layer.borderWidth = CGFloat(1.0)
        contactName.layer.cornerRadius = 8
        
        contactNumber.layer.borderColor = UIColor(red: 83/255, green: 219/255, blue: 207/255, alpha: 1).CGColor
        contactNumber.layer.borderWidth = CGFloat(1.0)
        contactNumber.layer.cornerRadius = 8
        
        addNewContactButton.layer.cornerRadius = 6

    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // ACTIONS
    
    
    
    func addingNewContact() {
        
        if contactNumber.text!.isEmpty {
            print ("neuspjesno")
        } else {
            let name = contactName.text ?? ""
            let number = contactNumber.text
            contact = Contact(name: name, phoneNumber: number!)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if addNewContact === sender || addNewContactButton === sender {
            addingNewContact()
        }
    }
   
}

