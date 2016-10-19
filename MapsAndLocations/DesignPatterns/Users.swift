//
//  Users.swift
//  DesignPatterns
//
//  Created by Test on 14.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class Users: NSObject {
    static let shared = Users()
    var users = [User]()
    
    private override init(){
        super.init()
    }
}
