//
//  MBGFullArticleBodyTableViewCell.swift
//  MBG Feed
//
//  Created by Jon Whitmore on 11/20/15.
//  Copyright © 2015 Jon Whitmore. All rights reserved.
//

import UIKit

// Article body. HTML payload rendered by UIWebView
class MBGFullArticleBodyTableViewCell: UITableViewCell {

    @IBOutlet weak var articleBodyWebView: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
