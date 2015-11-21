//
//  MBGFullArticleTableViewController.swift
//  MBG Feed
//
//  Created by Jon Whitmore on 11/20/15.
//  Copyright © 2015 Jon Whitmore. All rights reserved.
//

import UIKit

// Displays a complete article to the user
class MBGFullArticleTableViewController: UITableViewController {
    
    // JSON elements defining the article
    var articleDictionary = [String : AnyObject]()
    
    // Image property passed from the article feed
    var image :UIImage = UIImage()
    
    // Add a right swipe to the tableView
    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.tableView.addGestureRecognizer(swipeRight)
    }
    
    // Dismiss this view when the user swipes right
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    // MARK: - Table view data source

    // There will be only one section
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    // There will always be three rows: header, image, and article body
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // Enforce specific heights for the rows in the table
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch (indexPath.row) {
        case 0:
            return 100
        case 1:
            return 300
            
        case 2:
            return 300
            
        default:
            // We should never reach the default case
            return 50
            
        }
    }

    // Respond with one of our three table rows
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier("MBGFullArticleHeader", forIndexPath: indexPath) as! MBGFullArticleHeaderTableViewCell
            
            cell.articleTitle.text = articleDictionary["title"] as? String
            let authorDict = articleDictionary["author"] as! [String : String]
            cell.articleAuthor.text = authorDict["name"]
            
            return cell;
            
        } else if (indexPath.row == 1) {
            let cell = tableView.dequeueReusableCellWithIdentifier("MBGFullArticleImage", forIndexPath: indexPath) as! MBGFullArticleImageTableViewCell
            
            cell.articleImageView.image = self.image
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("MBGFullArticleBody", forIndexPath: indexPath) as! MBGFullArticleBodyTableViewCell
            
            let body = articleDictionary["body"] as! String
            cell.articleBodyWebView.loadHTMLString(body, baseURL: nil)
            
            return cell
        }
    }
}
