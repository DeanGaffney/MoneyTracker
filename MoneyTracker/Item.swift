//
//  Item.swift
//  MoneyTracker
//
//  Created by Dean Gaffney on 25/11/2016.
//  Copyright © 2016 Dean Gaffney. All rights reserved.
//

import Foundation

class Item : NSObject, NSCoding {
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
    
    //MARK : Archiving Paths
    static var documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    static let ArchiveURL = documentsDirectory.appendingPathComponent("items")
    
    //MARK : Types
    struct PropertyKey {
        static let nameKey = "name"
        static let costKey = "cost"
        static let dateKey = "date"
        static let categoryKey = "category"
    }

    
    init?(name: String, cost: Double,type: Category, purchaseDate: Date) {
        self.name = name
        self.cost = cost
        self.type = type
        self.purchaseDate = purchaseDate
        formatter.timeStyle = .none
        formatter.dateStyle = .short
        let formattedDate = formatter.string(from: self.purchaseDate)
        let dateComponents = formattedDate.components(separatedBy: "/")
        self.purchaseMonth = Int(dateComponents[0])!
        self.purchaseDay = Int(dateComponents[1])!
        self.purchaseYear = Int(dateComponents[2])!
        
        super.init()
        if name.isEmpty{
            return nil
        }
    }
    
    // MARK: Encoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(cost, forKey: PropertyKey.costKey)
        aCoder.encode(purchaseDate, forKey: PropertyKey.dateKey)
        aCoder.encode(type, forKey: PropertyKey.categoryKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let cost = aDecoder.decodeDouble(forKey: PropertyKey.costKey)
        let date = aDecoder.decodeObject(forKey: PropertyKey.dateKey) as! Date
        let type = aDecoder.decodeObject(forKey: PropertyKey.categoryKey) as! Category
        self.init(name: name, cost: cost,type: type,purchaseDate: date)
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
