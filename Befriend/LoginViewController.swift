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
    
    
    
    @IBAction func twitterLoginButton(sender: AnyObject) {
        let appDelegate = UIApplication.shared.delegate as!AppDelegate
        //print("signed in as \(appDelegate.METASESSION.twtSession?.userName)");
        //let twtWrapper = TwitterWrapper()
        //twtWrapper.followRequest(appDelegate.METASESSION.oAuthSwift);
        
        var params = Dictionary<String, String>()
        params["follow"] = "true"
        params["screen_name"] = "dmisiaszek"
        let _ =  appDelegate.METASESSION.oAuthSwift.client.post("https://api.twitter.com/1.1/friendships/create.json", parameters: params,
                                    success: { data, response in
                                        let dataString = String(data: data, encoding: String.Encoding.utf8)
                                        print("datastring", dataString)
            },
                                    failure: { error in
                                        print("the error is" , error)
            }
        )
       
    }
    
    
    



    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as!AppDelegate
//        let appDelegate = UIApplication.shared.delegate as!AppDelegate
//        Twitter.sharedInstance().start(withConsumerKey: "QJGRPjBbsOTJXbojwbg2jBrK0", consumerSecret: "SpQ0bkorYmSA0Q16yhSKmn0Qg2AhY37p32wnBeCxlpNWkLUZlK")
//        Fabric.with([Twitter.self()])
//        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
//            if (session != nil) {
//                appDelegate.METASESSION.twtSession = session;
//                print("signed in as \(session?.userName)");
//            } else {
//                print("error: \(error?.localizedDescription)");
//            }
//        })
//        logInButton.center = self.view.center
//        self.view.addSubview(logInButton)
        
        
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
                print("The username is: " , parameters["user_id"])
                print(credential.oauthToken);
                print(credential.oauthTokenSecret);
                //self.testTwitter(ooswift: ooswift);
            },
            failure: { error in
                print("The error is: " , error.localizedDescription)
            }
        )
        
        appDelegate.METASESSION.oAuthSwift = ooswift;
       
       

        
       }
    
    
    func testTwitter(ooswift: OAuth1Swift){
//        let _ = ooswift.client.get(
//            "https://api.twitter.com/1.1/followers/ids.json", parameters: [:],
//            success: { data, response in
//                let jsonDict = try? JSONSerialization.jsonObject(with:data, options: [])
//                print("statuses", jsonDict)
//            }, failure: { error in
//                print("theerroris:" , error)
//            }
//        )
        
                var params = Dictionary<String, String>()
                params["follow"] = "true"
                params["screen_name"] = "dmisiaszek"
                let _ = ooswift.client.post("https://api.twitter.com/1.1/friendships/create.json", parameters: params,
                                              success: { data, response in
                                                let dataString = String(data: data, encoding: String.Encoding.utf8)
                                                print("datastring", dataString)
                    },
                                              failure: { error in
                                                print("the error is" , error)
                    }
                )
    }
    
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
