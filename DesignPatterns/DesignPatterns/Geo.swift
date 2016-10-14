//
//  Geo.swift
//  DesignPatterns
//
//  Created by Test on 14.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class Geo: NSObject {
    var lat: String?
    var lng: String?
    init(lat: String, lng: String)
    {
        self.lat = lat
        self.lng = lng
    }
    override init() {
        super.init()    }
}
