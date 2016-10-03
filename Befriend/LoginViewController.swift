//
//  LoginViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 9/27/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit
import Fabric
import TwitterKit
import OAuthSwift

class LoginViewController: UIViewController{
    
    let appDelegate = UIApplication.shared.delegate as!AppDelegate
    
    @IBAction func twitterLoginButton(sender: AnyObject) {
        //LOGIN TO TWITTER
        
        // create an instance and retain it
        let ooswift = OAuth1Swift(
            consumerKey:    "5CKNUpJHS116KSHiyR5Y1Q305",
            consumerSecret: "B8votVYdSPFp5jJqIPdsKQjlF0jmXbWZVIBNZ3FLIac2ZFGV8u",
            requestTokenUrl: "https://api.twitter.com/oauth/request_token",
            authorizeUrl:    "https://api.twitter.com/oauth/authorize",
            accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
        )
        
        let _ = ooswift.authorize(
            withCallbackURL: URL(string: "befriend://oauth-callback/twitter")!,
            success: { credential, response, parameters in
                print("Authenticted with Service <Twitter>")
            },
            failure: { error in
                print("Twitter error is: " , error.localizedDescription)
            }
        )
        appDelegate.METASESSION.oAuthSwiftTwitter = ooswift;
        
        
        //let twtrWrapper : TwitterWrapper = TwitterWrapper()
        //twtrWrapper.followRequest(appDelegate.METASESSION.oAuthSwiftTwitter, screenName: "BefriendBen");
    
    }
    
    
    @IBAction func facebookLoginButton(_ sender: AnyObject) {
        //LOGIN TO Facebook
        
        // create an instance and retain it
        let ooswift = OAuth2Swift(
            consumerKey:    "1794801960757679",
            consumerSecret: "412e4d01c57084432f273bb6db11be27",
            authorizeUrl:   "https://www.facebook.com/dialog/oauth",
            accessTokenUrl: "https://graph.facebook.com/oauth/access_token",
            responseType:   "code"
        )
        let state = generateState(withLength: 20)
        
        let _ = ooswift.authorize(
            withCallbackURL: URL(string: "https://befriend-mizmattia.herokuapp.com/")!, scope: "public_profile", state: state,
            success: { credential, response, parameters in
                print("Authenticted with Service <Facebook>")
                
            }, failure: { error in
                print("Facebook error is: " , error.localizedDescription, terminator: "")
            }
        )
        appDelegate.METASESSION.oAuthSwiftFacebook = ooswift;
        
        
        //let fbWrapper : FacebookWrapper = FacebookWrapper()
        //fbWrapper.friendRequest(appDelegate.METASESSION.oAuthSwiftFacebook);
        
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let appDelegate = UIApplication.shared.delegate as!AppDelegate
        
        
       }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
