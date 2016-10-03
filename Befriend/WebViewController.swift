//
//  WebViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 10/3/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//


import Foundation
import UIKit
import Fabric
import TwitterKit
import OAuthSwift
typealias WebView = UIWebView

class WebViewController: OAuthWebViewController{

    
    var targetURL: URL?
    let webView: WebView = WebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.frame = UIScreen.main.bounds
        self.webView.scalesPageToFit = true
        self.webView.delegate = self
        self.view.addSubview(self.webView)
        loadAddressURL()
    }
    
    func loadAddressURL() {
        guard let url = targetURL else {
            return
        }
        let req = URLRequest(url: url)
 
        self.webView.loadRequest(req)
        }
    
}
    extension WebViewController: UIWebViewDelegate {
        func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
            if let url = request.url, url.scheme == "befriend" {
                // Call here AppDelegate.sharedInstance.applicationHandleOpenURL(url) if necessary ie. if AppDelegate not configured to handle URL scheme
                // compare the url with your own custom provided one in `authorizeWithCallbackURL`
                self.dismissWebViewController()
            }
            return true
        }
    }


