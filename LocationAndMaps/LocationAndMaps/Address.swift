//
//  Address.swift
//  LocationAndMaps
//
//  Created by Test on 17.10.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

    
class Address: NSObject {
        var street: String?
        var suite: String?
        var city: String?
        var zipcode: String?
        var geo: Geo?
        init(street: String, suite: String, city: String, zipcode: String, geo: Geo){
            self.street = street
            self.suite = suite
            self.city = city
            self.zipcode = zipcode
            self.geo = geo
        }
        override init() {
            super.init()
        }
}

