//
//  ViewController.swift
//  Zadatak13Animations
//
//  Created by Test on 02.11.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outerGreenSquare: UIView!
    @IBOutlet weak var outerOrangeSquare: UIView!
    @IBOutlet weak var innerGreenSquare: UIView!
    @IBOutlet weak var innerOrangeSquare: UIView!
    @IBOutlet weak var redSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outerGreenSquare.backgroundColor = UIColor.init(red:0.35, green:0.59, blue:0.20, alpha:1.0)
        outerOrangeSquare.backgroundColor = UIColor.init(red:1.00, green:0.64, blue:0.26, alpha:0.7)
        innerGreenSquare.backgroundColor = UIColor.init(red:0.60, green:0.63, blue:0.21, alpha:0.9)
        innerOrangeSquare.backgroundColor = UIColor.init(red:1.00, green:0.56, blue:0.00, alpha:1.0)
        redSquare.backgroundColor = UIColor.init(red:1.00, green:0.00, blue:0.00, alpha:0.6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playAnimation(_ sender: UIBarButtonItem) {
        
        UIView.animate(withDuration: 0.65, delay: 0, animations: {
            self.outerOrangeSquare.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: {_ in
            UIView.animate(withDuration: 1.3, delay: 0, animations: {
                self.outerOrangeSquare.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)}, completion: nil)})
        
        UIView.animate(withDuration: 1.1, delay: 0, animations: {
            self.innerGreenSquare.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: {_ in
            UIView.animate(withDuration: 0.1, delay: 0, animations: {
                self.innerGreenSquare.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)}, completion: nil)})
        
        UIView.animate(withDuration: 1.0, delay: 0.1, animations: {
            self.innerOrangeSquare.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        }, completion: {_ in
            UIView.animate(withDuration: 0.25, delay: 0.0, animations: {
                self.innerOrangeSquare.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)}, completion: nil)})
        
        UIView.animate(withDuration: 0.8, delay: 0.1, animations: {
            self.redSquare.transform = CGAffineTransform(scaleX: 5.7, y: 5.7)
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.redSquare.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)}, completion: nil)})
    }
}

