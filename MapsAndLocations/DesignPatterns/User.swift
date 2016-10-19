//
//  User.swift
//  DesignPatterns
//
//  Created by Test on 14.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class User: NSObject {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address : Address?
    var phone: String?
    var website: String?
    var company : Company?
    init(id: Int, name: String, username: String, email: String, address: Address, phone: String, website: String, company: Company){
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
        
    }
    override init() {
        super.init()    }
}
