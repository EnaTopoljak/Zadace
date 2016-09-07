//
//  SprendTracker.swift
//  SpendTrackerApp
//
//  Created by Test on 06.09.2016..
//  Copyright © 2016. ena. All rights reserved.
//

import UIKit

class SpendTracker: NSObject, NSCoding {
    
    //MARK: Properties
    
    var amount: String
    var descriptionOfTheExpense: String?
    var date: String
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("spendings")
    
    //MARK: Types
    
    struct ProperyKey {
        static let amountKey = "amount"
        static let descriptionKey = "descriptionOfTheExpense"
        static let dateKey = "date"
    }
    
    //MARK: Initialization
    
    init?(amount: String, descriptionOfTheExpense: String?, date: String) {
        self.amount = amount
        self.descriptionOfTheExpense = descriptionOfTheExpense
        self.date = date
        
        super.init()
        
        if amount.isEmpty {
            return nil
        }
    }
    
    //MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(amount, forKey: ProperyKey.amountKey)
        aCoder.encodeObject(descriptionOfTheExpense, forKey: ProperyKey.descriptionKey)
        aCoder.encodeObject(date, forKey: ProperyKey.dateKey)
    }
    
    required convenience init?(coder aCoder: NSCoder) {
        
        let amount = aCoder.decodeObjectForKey(ProperyKey.amountKey) as! String
        let descriptionOfTheExpense = aCoder.decodeObjectForKey(ProperyKey.descriptionKey) as! String
        let date = aCoder.decodeObjectForKey(ProperyKey.dateKey) as! String
        
        self.init(amount: amount, descriptionOfTheExpense : descriptionOfTheExpense, date: date)
        
    }
    
}
