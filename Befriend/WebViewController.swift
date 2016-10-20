//
//  WebViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 9/27/16.
//  Copyright © 2016 MizMattia. All rights reserved.
//

import OAuthSwift
import UIKit
    typealias WebView = UIWebView // WKWebView


class WebViewController: OAuthWebViewController{
    
//    var targetURL: URL?
//    let webView: WebView = WebView()
//    @IBOutlet weak var WebView: UIWebView!
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.webView.frame = UIScreen.main.bounds
//        self.webView.scalesPageToFit = true
//        self.webView.delegate = self
//        self.view.addSubview(self.webView)
//        loadAddressURL()
//
//        
//    }
//    
//    override func handle(_ url: URL) {
//        targetURL = url
//        super.handle(url)
//        self.loadAddressURL()
//    }
//
//    
//    func loadAddressURL() {
//        guard let url = targetURL else {
//            return
//        }
//        let req = URLRequest(url: url)
//            self.webView.loadRequest(req)
//
//    }
    
    
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
