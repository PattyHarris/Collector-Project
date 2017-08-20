//
//  CollectorTableViewController.swift
//  Collector
//
//  Created by Patty Harris on 8/16/17.
//  Copyright © 2017 Patty Harris. All rights reserved.
//

import UIKit

class CollectorTableViewController: UITableViewController {

    var items : [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Better to call this here...that way, when we return
        // back to this view, it is called again, not just on
        // first launch.
        getItems()
    }
    
    // Get the Items from Core Data
    func getItems() {
        
        if let context  =
            ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext) {
            
            do {
                let coreDataItems = try context.fetch(Item.fetchRequest()) as? [Item]
                
                if let coreDataItems = coreDataItems {
                    // We can just set our Item array to the one given
                    // to us by Core Data.
                    self.items = coreDataItems
                }
                
                tableView.reloadData()
            }
            catch {
                showAlert(message: "Could not retrieve the Collector items from the database!  Please try again.")
                return
            }
        }
    }
    
    func removeItem(item: Item) {
        
        // Get the managed object context
        if let context  =
            ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext) {
            
            context.delete(item)
            
        }
    }

    // Utility function (not part of tutorial)
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        // Configure the cell...
        let itemCell = items[indexPath.row]
        cell.textLabel?.text = itemCell.title
        
        if let imageData = itemCell.image {
            cell.imageView?.image = UIImage(data: imageData)
        }

        return cell 
    }

    // Allow conditional editing of cells.  Even though we're only using "delete", you
    // need this function as well.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Provide support for editing the tableView.  We are only using "delete" - using swipe left.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // First remove the row for Core Data
            let item = items[indexPath.row]
            removeItem(item: item)
            
            // Remove it from the tableView.  This gets the items AND resets the items
            // array.
            getItems()
        }
        else if editingStyle == .insert {
            // Insert a new row...
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
