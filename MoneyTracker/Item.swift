//
//  Item.swift
//  MoneyTracker
//
//  Created by Dean Gaffney on 25/11/2016.
//  Copyright © 2016 Dean Gaffney. All rights reserved.
//

import Foundation

class Item {
    public enum Category : String{
        case FOOD = "Food"
        case DRINK = "Drink"
        case CAR = "Car"
        case BILL = "Bill"
        case MISC = "Misc"
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
    
    public func getCost()->Double{
        return self.cost
    }
    
    public func getPurchaseDate()->Date{
        return self.purchaseDate
    }
    
    public func getCategory()->Category{
        return self.type
    }
    
    public func getName()->String{
        return self.name
    }
}
