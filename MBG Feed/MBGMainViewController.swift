//
//  MBGMainViewController.swift
//  MBG Feed
//
//  Created by Jon Whitmore on 11/19/15.
//  Copyright © 2015 Jon Whitmore. All rights reserved.
//

import UIKit

// The VC class used to display the initial list of articles at startup
class MBGMainViewController: UITableViewController {

    // HTTPS URL for the JSON payload representing the list of articles
    let kArticleJSONURL = "https://s3.amazonaws.com/mbgd/feed/prod-test-7fc12640-6f09-4461-b683-3e55acdfd4f4.json";
    
    // Article JSON realised as an array of dictionaries, etc.
    var articleArray = [];
    
    // Feed images already downloaded are cached for table redraws
    var articleFeedImageCache = [String : UIImage]()
    
    
    // Download the article feed and tell our tableView to reload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialJSON()
    }
    
    // Show the user a progress indicator while the article feed is download
    func loadInitialJSON() {
        let url = NSURL(string: kArticleJSONURL)!
        
        asynchronousDataFromUrl(url, completion: {(data, response, error) in
            if (error != nil) {
                print(error?.localizedDescription)
            } else {
                self.articleArray = self.jsonDataToObjects(data!)!
                print("size is \(self.articleArray.count)")
                
                // Update in the main thread
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    // Convience method to create an NSURLSession data task and start it
    func asynchronousDataFromUrl(url: NSURL,
        completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
            
            NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
                completion(data: data, response: response, error: error)
                
        }.resume()
    }
    
    func downloadImage(url: NSURL, name: String, indexPath: NSIndexPath){
        print("Started downloading \"\(url.URLByDeletingPathExtension!.lastPathComponent!)\".")
        // download in the background
        asynchronousDataFromUrl(url) { (data, response, error)  in
            // update on the main thread
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil
                    else { return }
                print("Finished downloading \"\(url.URLByDeletingPathExtension!.lastPathComponent!)\".")
                self.articleFeedImageCache[name] = UIImage(data: data)
                let paths = [indexPath]
                self.tableView.reloadRowsAtIndexPaths(paths, withRowAnimation: .Fade)
            }
        }
    }

    // Convert from NSData to array of
    func jsonDataToObjects(data: NSData) -> NSArray? {
        do {
            return try (
                NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? NSArray
            )
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MBGArticleTVCell") as! MBGArticleTableViewCell
        
        let dict = self.articleArray[indexPath.row] as! [String : AnyObject]
        let title = dict["title"] as! String
        let authorDict = dict["author"] as! [String : String]
        let author = authorDict["name"]
        let imageURLString = dict["image"] as! String
        
        cell.articleAuthor.text = author
        cell.articleTitle.text = title
        if ((self.articleFeedImageCache[imageURLString]) != nil) {
            cell.articleImage.image = self.articleFeedImageCache[imageURLString]
        } else {
            // reused cells will have the wrong image, blank it out
            cell.articleImage.image = nil;
            let url = NSURL(string: imageURLString)!
            downloadImage(url, name: imageURLString, indexPath: indexPath);
        }
        return cell
    }
    
    // Dump the image cache
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        articleFeedImageCache.removeAll();
        
    }

}

