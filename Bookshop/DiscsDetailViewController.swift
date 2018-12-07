//
//  DiscsDetailViewController.swift
//  Bookshop
//
//  Created by Weronika Piotrowska on 26/11/2018.
//  Copyright © 2018 nimbusek. All rights reserved.
//

import UIKit

class DiscsDetailViewController: UIViewController {
    
    @IBOutlet var discImageView: UIImageView!
    @IBOutlet var discTitle: UILabel!
    @IBOutlet var discArtist: UILabel!
    @IBOutlet var discType: UILabel!
    @IBOutlet var discYear: UILabel!
    @IBOutlet var discCost: UILabel!
    @IBOutlet var discDescription: UITextView!
    
    var discTitleName = ""
    var discArtistName = ""
    var discTypeName = ""
    var discYearName = ""
    var discCostName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        discImageView.image = UIImage(named: "discs")
        discTitle.text = discTitleName
        discArtist.text = discArtistName
        discType.text = discTypeName
        discYear.text = discYearName
        discCost.text = discCostName
        discDescription.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        navigationItem.largeTitleDisplayMode = .never

        // Do any additional setup after loading the view.
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
