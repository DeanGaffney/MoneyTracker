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
    let formatter = DateFormatter()
    var type: Category          //type of item purchased
    var name: String            //name of item purchased
    var cost: Double            //cost of item
    var purchaseDate: Date              //date item was purchased
    var purchaseMonth: Int
    var purchaseYear: Int
    var purchaseDay : Int
    
    init(name: String, cost: Double,type: Category) {
        self.name = name
        self.cost = cost
        self.type = type
        self.purchaseDate = Date()
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        let formattedDate = formatter.string(from: self.purchaseDate)
        let dateComponents = formattedDate.components(separatedBy: "/")
        self.purchaseMonth = Int(dateComponents[0])!
        self.purchaseDay = Int(dateComponents[1])!
        self.purchaseYear = Int(dateComponents[2])!
    }
    
    public func getPurchaseMonth()->Int{
        return self.purchaseMonth
    }
    
    public func getPurchaseDay()->Int{
        return self.purchaseDay
    }
    
    public func getPurchaseYear()->Int{
        return self.purchaseYear
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
