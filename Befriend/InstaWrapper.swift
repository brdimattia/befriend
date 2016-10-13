//
//  InstaWrapper.swift
//  Befriend
//
//  Created by Danielle Misiaszek on 10/13/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit
import OAuthSwift


class InstaWrapper{
    doOAuthInstagram(parameters)
    //Makes a follow request to screenName over the verified Authentication request
    func followRequest(_ oauthswift: OAuth1Swift, screenName: String){
        UIApplication.sharedApplication().openURL(NSURL(string: "https://api.instagram.com/oauth/authorize/?client_id=3d4fca2662944a0193f555c2f7f79258&redirect_uri=https://befriend-mizmattia.herokuapp.com&response_type=code")!)
        var params = Dictionary<String, String>()
        params["follow"] = "true"
        params["screen_name"] = screenName
        let _ =  oauthswift.client.post("https://api.instagram.com/v1/users/{user-id}/relationship?access_token=ACCESS-TOKEN", parameters: params,
                                        success: { data, response in
                                            let dataString = String(data: data, encoding: String.Encoding.utf8)
                                            print("datastring", dataString)
            },
                                        failure: { error in
                                            print("the error is" , error)
            }
        )
        
    }
    func doOAuthInstagram(_ serviceParameters: [String:String]){
        let oauthswift = OAuth2Swift(
            consumerKey:    serviceParameters["consumerKey"]!,
            consumerSecret: serviceParameters["consumerSecret"]!,
            authorizeUrl:   "https://api.instagram.com/oauth/authorize",
            responseType:   "token"
            // or
            // accessTokenUrl: "https://api.instagram.com/oauth/access_token",
            // responseType:   "code"
        )
        
        let state = generateState(withLength: 20)
        self.oauthswift = oauthswift
        oauthswift.authorizeURLHandler = getURLHandler()
        let _ = oauthswift.authorize(
            withCallbackURL: URL(string: "oauth-swift://oauth-callback/instagram")!, scope: "relationships", state:state,
            success: { credential, response, parameters in
                self.showTokenAlert(name: serviceParameters["name"], credential: credential)
            },
            failure: { error in
                print(error.description)
            }
        )

}
