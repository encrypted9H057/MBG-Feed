//
//  MBGFullArticleHeaderTableViewCell.swift
//  MBG Feed
//
//  Created by Jon Whitmore on 11/20/15.
//  Copyright © 2015 Jon Whitmore. All rights reserved.
//

import UIKit

class MBGFullArticleHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var articleTitle: UILabel!
    
    @IBOutlet weak var articleAuthor: UILabel!
    
    @IBOutlet weak var articlePublishDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
