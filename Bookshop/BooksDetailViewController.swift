//
//  BooksDetailViewController.swift
//  Bookshop
//
//  Created by Weronika Piotrowska on 26/11/2018.
//  Copyright © 2018 nimbusek. All rights reserved.
//

import UIKit
import CoreData

class BooksDetailViewController: UIViewController {
    
    @IBOutlet var bookImageView: UIImageView!
    @IBOutlet var bookTitle: UILabel!
    @IBOutlet var bookAuthor: UILabel!
    @IBOutlet var bookYear: UILabel!
    @IBOutlet var bookPublisher: UILabel!
    @IBOutlet var bookCost: UILabel!
    @IBOutlet var bookDescription: UITextView!

    var bookTitleName = ""
    var bookAuthorName = ""
    var bookYearName = ""
    var bookPublisherName = ""
    var bookCostName = 0.0
    
    var basketItems = [BasketTest]()
    var dat:NSManagedObjectContext!
    // 3
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dat = appDelegate?.persistentContainer.viewContext
        
        bookImageView.image = UIImage(named: "books")
        bookTitle.text = bookTitleName
        bookAuthor.text = bookAuthorName
        bookYear.text = bookYearName
        bookPublisher.text = bookPublisherName
        bookCost.text = String(format:"%.2f", bookCostName)
        bookDescription.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBasketFromBook" {
                let destinationController = segue.destination as! BasketTableViewController
                destinationController.basketTitleName.append(bookTitleName)
                //destinationController.basketCostName.append(bookCostName)
            }
        
    }

    @IBAction func addBookToBasket(_ sender: UIButton) {
        let basketItem = BasketTest(context: dat)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BasketTest")
        var flag = false
        do {
            let result = try dat.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                if data.value(forKey: "title") as? String == bookTitleName {
                    flag = true
                }
            }
        } catch {
            print ("Falied")
        }
        
        if flag == true {
            basketItem.title = "Udalo sie!"
            basketItem.cost = Decimal(bookCostName) as NSDecimalNumber
        } else {
            basketItem.title = bookTitleName
            basketItem.cost = Decimal(bookCostName) as NSDecimalNumber
        }
        
        appDelegate?.saveContext()
        
        loadData()
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
       // self.tableView.reloadData()
    }
    
    func retrieveData() {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
