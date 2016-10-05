//
//  Posts.swift
//  iOS Networking
//
//  Created by Test on 05.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class Posts: NSObject {

    var id: String?
    var title: String?
    var body: String?
    
    init(id: String, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
        
     
    }
    override init () {
        super.init ()
    }
}
