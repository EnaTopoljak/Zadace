//
//  API.swift
//  DesignPatterns
//
//  Created by Test on 14.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class API: NSObject {
    
    static var shared = API()
    private override init (){
        super.init()
    }
    func refreshUsers(){
        let serverComunicationInstance = ServerCommunication()
        serverComunicationInstance.refreshUsers()
    }

}
