//
//  MBGArticleTableViewCell.swift
//  MBG Feed
//
//  Created by Jon Whitmore on 11/19/15.
//  Copyright © 2015 Jon Whitmore. All rights reserved.
//

import UIKit

class MBGArticleFeedTableViewCell: UITableViewCell {

    // The feed article's image
    @IBOutlet weak var articleImage: UIImageView!
    
    // Right justified author label
    @IBOutlet weak var articleAuthor: UILabel!
    
    // Left justified Article title
    @IBOutlet weak var articleTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
