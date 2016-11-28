//
//  Tracker.swift
//  MoneyTracker
//
//  Created by Dean Gaffney on 25/11/2016.
//  Copyright © 2016 Dean Gaffney. All rights reserved.
//

import Foundation

class Tracker {
    var items = [Item]()
    var name: String        //name of tracker
    var creationDate: Date          //date tracker was created by user
    init(name: String, creationDate: Date) {
        self.name = name
        self.creationDate = creationDate
    }
    
    // MARK: Modifiers
    
    func addItem(newItem: Item){
        // add new item to items array
        items.append(newItem)
    }
    
    func removeItem(index : Int){
        //remove item
        items.remove(at: index)
    }
    
    // MARK: Actions
    
    //return total of all items in list
    func getTotal()->Double{
        return items.reduce(0,{$0
            + $1.cost})
    }
}
