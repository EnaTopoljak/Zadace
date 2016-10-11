//
//  User.swift
//  iOS Networking
//
//  Created by Test on 04.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: Address?
    var phone: String?
    var website: String?
    var company: Company?
    var posts: Posts?
    
    init(id: Int, name: String, username: String, email: String, address: Address, phone: String, website: String, company: Company, posts: Posts) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
        self.posts = posts
       
        
    }
    
    override init () {
        super.init ()
    }
}
