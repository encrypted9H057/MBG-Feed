//
//  MBGFullArticleTableViewController.swift
//  MBG Feed
//
//  Created by Jon Whitmore on 11/20/15.
//  Copyright © 2015 Jon Whitmore. All rights reserved.
//

import UIKit

class MBGFullArticleTableViewController: UITableViewController {
    
    var articleDictionary = [String : AnyObject]()
    
    var image :UIImage = UIImage()
    
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
        // Dispose of any resources that can be recreated.
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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
    
    
        // Pass the selected object to the new view controller.
    }
    */

}
