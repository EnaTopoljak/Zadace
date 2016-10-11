//
//  Posts.swift
//  iOS Networking
//
//  Created by Test on 05.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class Posts: NSObject {

    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    init(userId: Int, id: Int, title: String, body: String) {
        
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        
     
    }
    override init () {
        super.init ()
    }
}
