//
//  UserViewController.swift
//  LocationAndMaps
//
//  Created by Test on 26.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var websiteTextField: UITextField!
    
    @IBOutlet weak var companyTextField: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        topView.backgroundColor = UIColor(red: 87/255, green: 138/255, blue: 163/255, alpha: 1)
        imageView.image = UIImage(named: "Image\(arc4random_uniform(2) + 1)")
        userLabel.text = Users.shared.users.last?.name
        nameTextField.text = Users.shared.users.last?.name
        usernameTextField.text = Users.shared.users.last?.username
        emailTextField.text = Users.shared.users.last?.email
        addressTextField.text = Users.shared.users.last?.address?.street
        phoneTextField.text = Users.shared.users.last?.phone
        if phoneTextField.text == "" {
            phoneTextField.text = "Unknown"
        }
        websiteTextField.text = Users.shared.users.last?.website
        if websiteTextField.text == "" {
            websiteTextField.text = "Unknown"
        }
        companyTextField.text = Users.shared.users.last?.company?.name
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
