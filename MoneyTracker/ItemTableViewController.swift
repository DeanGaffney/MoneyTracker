//
//  ItemTableViewController.swift
//  MoneyTracker
//
//  Created by Dean Gaffney on 25/11/2016.
//  Copyright © 2016 Dean Gaffney. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    //items from selected tracker to display
    var items = [Item]()
    var seguedItems = [Item](){
        didSet{
            items = seguedItems
        }
    }
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        print(items)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ItemTableViewCell
        
        let item = items[indexPath.row]
        cell.itemNameLabel.text = item.getName()
        cell.itemCostLabel.text = String(format:"€%.2f",item.getCost())
        cell.itemCategoryLabel.text = item.getCategory().rawValue
        cell.purchaseDateLabel.text = formatter.string(for: item.getPurchaseDate())
        // Configure the cell...
        
        return cell
    }
 
    //load some sample items for testing
    func loadSampleItems(){
        let item1 = Item(name: "Coffee", cost: 2.25, type: Item.Category.DRINK)
        let item2 = Item(name: "Burger", cost: 3.15, type: Item.Category.FOOD)
        let item3 = Item(name: "Petrol", cost: 20.10, type: Item.Category.CAR)
        
        items += [item1,item2,item3]
    }

}
