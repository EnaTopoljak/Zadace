//
//  ViewController.swift
//  SpendTrackerApp
//
//  Created by Test on 06.09.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties 
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!

    @IBOutlet weak var selectedDate: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var spent: SpendTracker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaultDate()
        amountTextField.delegate = self
        descriptionTextField.delegate = self
        
        if let spent = spent {
            navigationItem.title = spent.date
            amountTextField.text = spent.amount
            descriptionTextField.text = spent.descriptionOfTheExpense
            selectedDate.text = spent.date
        }
        
        checkValidInput()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    
    func checkValidInput () {
        let text = amountTextField.text
        
        saveButton.enabled = !text!.isEmpty
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidInput()
        amountTextField.text = amountTextField.text
        descriptionTextField.text = descriptionTextField.text
    }
    
    // Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddExpenseMode = presentingViewController is UINavigationController
        if isPresentingInAddExpenseMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let amount = amountTextField.text
            let descriptionOfTheExpense = descriptionTextField.text ?? ""
            let date = selectedDate.text
            
            spent = SpendTracker(amount: amount!, descriptionOfTheExpense: descriptionOfTheExpense, date: date!)
        }
    }
    
    //Action

    @IBAction func datePickerAction(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy."
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        self.selectedDate.text = strDate
    }
    
    func setDefaultDate() {
        let today = NSDateFormatter()
        today.dateFormat = "dd.MM.yyyy."
        let todaysDate = today.stringFromDate(NSDate())
        self.selectedDate.text = todaysDate
    }
    
    //MARK: NSCoding
    
}

