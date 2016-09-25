//
//  Contact.swift
//  Dopuna
//
//  Created by Test on 21.09.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class Contact {
    
    var name: String?
    var phoneNumber: String
    
    init? (name: String?, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
        
        if phoneNumber.isEmpty {
            return nil
        }
    }
}