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
    //let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedItems = loadItems(){
            print("Tried getting saved items on view load")
            items += savedItems
            
        }else{
            print("Loaded sample items")
            loadSampleItems()
        }
    }
    
    //add navbar items for adding new item and graph action
    override func viewWillAppear(_ animated: Bool) {
        let add = UIBarButtonItem(barButtonSystemItem: .add,target: self,action: #selector(ItemTableViewController.addItemButtonPressed))
        let action = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(ItemTableViewController.graphButtonPressed))
        self.navigationItem.setRightBarButtonItems([add,action,editButtonItem], animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChartViewController"{
            let viewController = segue.destination as! ChartViewController
            viewController.items = items
            print("Should have went to chart view controller")
        }else if segue.identifier == "showDetail"{
            let itemViewController = segue.destination as! ItemViewController
            if let selectedCell = sender as? ItemTableViewCell{
                let indexPath = tableView.indexPath(for: selectedCell)
                let selectedItem = items[(indexPath?.row)!]
                itemViewController.item = selectedItem
            }
        }
    }

    
    func graphButtonPressed(){
        print("Graph button pressed")
        performSegue(withIdentifier: "ChartViewController", sender: self)
    }
    
    func addItemButtonPressed(){
        print("Clicked add item button")
        //perform a segue into a new view where user fills out details of the item
        performSegue(withIdentifier: "ItemViewController", sender: self)
        print("Made it to Add Item Controller") 
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
        cell.purchaseDateLabel.text = String(format: "%d/%d/%d",item.getPurchaseDay(),item.getPurchaseMonth(),item.getPurchaseYear())        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //delete row from data source
            items.remove(at: indexPath.row)
            print("Made it to save when deleting")
            saveItems()
            print("Made it past save when deleting...")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
       
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
 
    //load some sample items for testing
    func loadSampleItems(){
        let item1 = Item(name: "Coffee", cost: 2.25, type: Item.Category.DRINK, purchaseDate: Date())
        let item2 = Item(name: "Burger", cost: 3.15, type: Item.Category.FOOD, purchaseDate: Date())
        let item3 = Item(name: "Petrol", cost: 20.10, type: Item.Category.CAR, purchaseDate: Date())
        
        items.append(item1!)
        items.append(item2!)
        items.append(item3!)
    }
    
    // MARK: Navigation
    @IBAction func unwindToTrackerList(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? ItemViewController, let item = sourceViewController.item{
            
            //update item
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                items[selectedIndexPath.row] = item
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }else{
            //add a new item
                let newIndexPath = IndexPath(row: items.count, section: 0)
            
                items.append(item)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
            //save items
            print("In unwind made it to save")
            saveItems()
        }
    }
    
    func saveItems(){
        NSKeyedArchiver.archiveRootObject(items, toFile: Item.ArchiveURL.path)
    }
    
    func loadItems()->[Item]?{
        print("In load items.......")
        return NSKeyedUnarchiver.unarchiveObject(withFile: Item.ArchiveURL.path) as? [Item]
    }


}
