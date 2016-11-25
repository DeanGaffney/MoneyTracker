//
//  TrackerTableViewController.swift
//  MoneyTracker
//
//  Created by Dean Gaffney on 25/11/2016.
//  Copyright © 2016 Dean Gaffney. All rights reserved.
//

import UIKit

class TrackerTableViewController: UITableViewController {
    
    @IBAction func addTracker(_ sender: Any) {
        let alert = UIAlertController(title: "New name",message:  "Enter a name for your tracker",preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",style: .default){
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                let trackerName = textField.text else{
                    return
            }
            //create new tracker with user input name
            self.trackers.append(Tracker(name: trackerName))
            self.tableView.reloadData()
            print("Added new tracker and reloaded table")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert,animated: true)
      
    }
    
    var trackers = [Tracker]()
    override func viewDidLoad() {
        super.viewDidLoad()

        //load sample tracker data
        loadSampleTrackers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return trackers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TrackerTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TrackerTableViewCell
        
        let tracker = trackers[indexPath.row]
        cell.nameLabel.text = tracker.name
        cell.totalLabel.text = String(format:"€%.2f",tracker.getTotal())
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadSampleTrackers(){
        let tracker1 = Tracker(name : "MONEY")
        tracker1.items.append(Item(name: "Coffee", cost: 2.50, type: Item.Category.DRINK))
        tracker1.items.append(Item(name: "Breakfast", cost: 5.50, type: Item.Category.FOOD))
        print(tracker1.getTotal())
        print(tracker1.creationDate)
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        print("Formatted Date is \(formatter.string(from: tracker1.creationDate))")
        for item in tracker1.items{
            print(item.purchaseDate)

        }
        
        
        let tracker2 = Tracker(name: "MONEY2")
        let tracker3 = Tracker(name: "MONEY3")
        trackers += [tracker1,tracker2,tracker3]
    }

}
