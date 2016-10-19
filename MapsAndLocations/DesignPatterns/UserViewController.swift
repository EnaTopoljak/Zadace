//
//  UserViewController.swift
//  DesignPatterns
//
//  Created by Test on 14.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    var user = User()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

   
    @IBAction func saveNewUser(_ sender: UIBarButtonItem) {
        if username.text!.isEmpty && email.text!.isEmpty {
        } else {
    
        user.name = username.text
        user.email = email.text
        Users.shared.users.append(user)
        navigationController?.popViewController(animated: true)
        }
        
    }
}
