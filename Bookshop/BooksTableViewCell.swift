//
//  BooksTableViewCell.swift
//  Bookshop
//
//  Created by Weronika Piotrowska on 25/11/2018.
//  Copyright © 2018 nimbusek. All rights reserved.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var publisherLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = 45
            thumbnailImageView.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
