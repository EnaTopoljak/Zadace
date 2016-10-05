//
//  Company.swift
//  iOS Networking
//
//  Created by Test on 04.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class Company: NSObject {
    var name: String?
    var catchPhrase: String?
    var bs: String?
    
    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    override init () {
        super.init ()
    }
}
