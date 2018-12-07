//
//  BasketTableViewController.swift
//  Bookshop
//
//  Created by Weronika Piotrowska on 26/11/2018.
//  Copyright © 2018 nimbusek. All rights reserved.
//

import UIKit
import CoreData

class BasketTableViewController: UITableViewController {
    
    var count = 10;
    var basketTitleName = [""]
    var basketCostName = [""]
    
    var basketItems = [BasketTest]()
    var dat:NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as? AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 76;
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        dat = appDelegate?.persistentContainer.viewContext
        self.tableView.dataSource = self
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return basketItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BasketTableViewCell
        
        let foodItem = basketItems[indexPath.row]
        
        //Configure cell
        //cell.titleLabel.text = basketTitleName[indexPath.row]
        cell.titleLabel.text = foodItem.title
        //cell.costLabel.text = basketCostName[indexPath.row]
        cell.costLabel.text = foodItem.cost?.description
        //cell.thumbnailImageView.image = UIImage(named: bookTitles[indexPath.row])
        cell.thumbnailImageView.image = UIImage(named: "books")
        
        return cell
    }
    
    func loadData(){
        // 1
        let foodRequest:NSFetchRequest<BasketTest> = BasketTest.fetchRequest()
        
        // 2
        //let sortDescriptor = NSSortDescriptor(key: "added", ascending: false)
        //foodRequest.sortDescriptors = [sortDescriptor]
        
        // 3
        do {
            try basketItems = dat.fetch(foodRequest)
        }catch {
            print("Could not load data")
        }
        
        // 4
        self.tableView.reloadData()
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
