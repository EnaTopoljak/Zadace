//
//  MainViewController.swift
//  Dopuna
//
//  Created by Test on 27.09.2016..
//  Copyright © 2016. Merima & Ena. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Do any additional setup after loading the view.
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
          
            iznos.setTitle("2KM", forSegmentAtIndex: 0)
            iznos.setTitle("3KM", forSegmentAtIndex: 1)
            iznos.setTitle("4KM", forSegmentAtIndex: 2)
            iznos.setTitle("5KM", forSegmentAtIndex: 3)
            iznos.setTitle("10KM", forSegmentAtIndex: 4)
            
        }
        if mreza.selectedSegmentIndex == 1 {
            iznos.setTitle("1KM", forSegmentAtIndex: 0)
            iznos.setTitle("2KM", forSegmentAtIndex: 1)
            iznos.setTitle("5KM", forSegmentAtIndex: 2)
            iznos.setTitle("10KM", forSegmentAtIndex: 3)
            iznos.setTitle("20KM", forSegmentAtIndex: 4)
        }
    }
}
