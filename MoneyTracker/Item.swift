//
//  Item.swift
//  MoneyTracker
//
//  Created by Dean Gaffney on 25/11/2016.
//  Copyright © 2016 Dean Gaffney. All rights reserved.
//

import Foundation

class Item {
   public enum Category {
        case FOOD
        case DRINK
        case CAR
        case BILL
        case MISC
    }
    
    var type: Category          //type of item purchased
    var name: String            //name of item purchased
    var cost: Double            //cost of item
    var purchaseDate: Date              //date item was purchased
    
    init(name: String, cost: Double,type: Category) {
        self.name = name
        self.cost = cost
        self.type = type
        self.purchaseDate = Date()
    }
}
