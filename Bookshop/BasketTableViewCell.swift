//
//  BasketTableViewCell.swift
//  Bookshop
//
//  Created by Weronika Piotrowska on 26/11/2018.
//  Copyright © 2018 nimbusek. All rights reserved.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = 30
            thumbnailImageView.clipsToBounds = true
        }
    }
    @IBOutlet var costLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
