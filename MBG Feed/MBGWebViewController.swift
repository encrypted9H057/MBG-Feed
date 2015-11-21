//
//  MBGWebViewController.swift
//  MBG Feed
//
//  Created by Jon Whitmore on 11/21/15.
//  Copyright © 2015 Jon Whitmore. All rights reserved.
//

import UIKit

// Displays a MindBodyGreen article in a UIWebView and acts as it's delegate
// This solution made it necessary to add cloudinary.com as an App Transport 
// Security Setting exception in info.plist to display article images
//
// In fact this implementation will behoove us to completely disable ATSS
// as a MBG article could link to thousands of reputable websites
//
class MBGWebViewController: UIViewController, UIWebViewDelegate {
    
    // Our soon to be deprecated hero
    // iOS 8 and beyond it is recommended to use WKWebView, but I don't think
    // that iss necessary for this sample app (see: http://nshipster.com/wkwebkit/ )
    @IBOutlet weak var webView: UIWebView!
    
    // Combined with a valid article id this URL represents a MBG article
    let kBaseArticleURL = "http://www.mindbodygreen.com/0-"
    
    // Property to be set by previous view controller. This default value leads to a "article not found" page
    var articleIdString = "1"
    
    // Use the base URL and article id to form a valid MindBodyGreen URL
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = kBaseArticleURL + articleIdString + "/"
        
        let url = NSURL (string: urlString);
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
        
    }

}
