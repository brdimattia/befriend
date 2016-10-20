//
//  LoginViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 9/27/16.
//  Copyright © 2016 MizMattia. All rights reserved.
//

import Foundation
import UIKit
import Fabric
import TwitterKit
import OAuthSwift

class LoginViewController: UIViewController{
    
    let appDelegate = UIApplication.shared.delegate as!AppDelegate
    
    
    @IBAction func LogintoInsta(_ sender: AnyObject) {
        let oioswift = OAuth2Swift(
            consumerKey:    "96bcd464e3be4e9ea2159268ad4fa456",//"3d4fca2662944a0193f555c2f7f79258",
            consumerSecret: "83b62975e47848f2b6c68bf53db8ab81", //"44f87746f9b1460388b95eaaddbc494a",
            authorizeUrl:   "https://api.instagram.com/oauth/authorize",
            responseType:   "token"
        )
        
        let state = generateState(withLength: 20)
        oioswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oioswift)
        let _ = oioswift.authorize(
            withCallbackURL: URL(string: "http://befriend-mizmattia.herokuapp.com/callback/instagram")!, scope: "relationships", state:state,
            success: { credential, response, parameters in
                print("Authenticted with Service <Instagram>")
                //        let igWrapper : InstaWrapper = InstaWrapper()
                //        igWrapper.followRequest(appDelegate.METASESSION.oAuthSwiftInsta, screenName: "zacefron");
            },
            failure: { error in
                print("Instagram error is: " , error)
            }
        )
        appDelegate.METASESSION.oAuthSwiftInsta = oioswift;


    }
    
    @IBAction func twitterLoginButton(sender: AnyObject) {
        //LOGIN TO TWITTER
        
        // create an instance and retain it

        let otoswift = OAuth1Swift(
            consumerKey:    "5CKNUpJHS116KSHiyR5Y1Q305",
            consumerSecret: "B8votVYdSPFp5jJqIPdsKQjlF0jmXbWZVIBNZ3FLIac2ZFGV8u",
            requestTokenUrl: "https://api.twitter.com/oauth/request_token",
            authorizeUrl:    "https://api.twitter.com/oauth/authorize",
            accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
        )
        otoswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: otoswift)
        let _ = otoswift.authorize(
            withCallbackURL: URL(string: "befriend://oauth-callback/twitter")!,
            success: { credential, response, parameters in
                print("Authenticted with Service <Twitter>")
                //let twtrWrapper : TwitterWrapper = TwitterWrapper()
                //twtrWrapper.followRequest(appDelegate.METASESSION.oAuthSwiftTwitter, screenName: "BefriendBen");
            },
            failure: { error in
                print("Twitter error is: " , error.localizedDescription)
            }
        )
        appDelegate.METASESSION.oAuthSwiftTwitter = otoswift;
        
        
        
    
    }
    
    
    @IBAction func facebookLoginButton(_ sender: AnyObject) {
        //LOGIN TO Facebook
        
        // create an instance and retain it
        let ofoswift = OAuth2Swift(
            consumerKey:    "1794801960757679",
            consumerSecret: "412e4d01c57084432f273bb6db11be27",
            authorizeUrl:   "https://www.facebook.com/dialog/oauth",
            accessTokenUrl: "https://graph.facebook.com/oauth/access_token",
            responseType:   "code"
        )
        
        ofoswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: ofoswift)
        let state = generateState(withLength: 20)
        
        let _ = ofoswift.authorize(
            withCallbackURL: URL(string: "https://befriend-mizmattia.herokuapp.com/")!, scope: "public_profile", state: state,
            success: { credential, response, parameters in
                print("Authenticted with Service <Facebook>")
                //let fbWrapper : FacebookWrapper = FacebookWrapper()
                //fbWrapper.friendRequest(appDelegate.METASESSION.oAuthSwiftFacebook);
                
            }, failure: { error in
                print("Facebook error is: " , error.localizedDescription, terminator: "")
            }
        )
        appDelegate.METASESSION.oAuthSwiftFacebook = ofoswift;
        
        
        
        
    }
    
    
    @IBAction func linkedinLoginButton(_ sender: AnyObject) {
        //LOGIN TO Linked
        
        // create an instance and retain it
        let oloswift = OAuth1Swift(
            consumerKey:    "75ogvdc0kdtufq",
            consumerSecret: "7lcig3J90BiRScKd",
            requestTokenUrl: "https://api.linkedin.com/uas/oauth/requestToken",
            authorizeUrl:    "https://api.linkedin.com/uas/oauth/authenticate",
            accessTokenUrl:  "https://api.linkedin.com/uas/oauth/accessToken"
        )

        oloswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oloswift)
        
        let _ = oloswift.authorize(
            withCallbackURL: URL(string: "befriend://oauth-callback/linkedin")!,
            success: { credential, response, parameters in
                print("Authenticted with Service <Linkedin>")
                //let liWrapper : LinkedinWrapper = LinkedinWrapper()
                //liWrapper.connectRequest(appDelegate.METASESSION.oAuthSwiftLinkedin);
            },
            failure: { error in
                print(error.localizedDescription)
            }
        )
        appDelegate.METASESSION.oAuthSwiftLinkedin = oloswift;
        
        
        

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
