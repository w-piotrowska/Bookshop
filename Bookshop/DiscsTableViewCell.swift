//
//  DiscsTableViewCell.swift
//  Bookshop
//
//  Created by Weronika Piotrowska on 26/11/2018.
//  Copyright © 2018 nimbusek. All rights reserved.
//

import UIKit

class DiscsTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
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
