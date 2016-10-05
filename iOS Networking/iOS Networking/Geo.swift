//
//  Geo.swift
//  iOS Networking
//
//  Created by Test on 04.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class Geo: NSObject {
    var lat: String?
    var lng: String?

    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
    override init () {
        super.init ()
    }
}
