//
//  MetaSession.swift
//  Befriend
//
//  Created by Ben DiMattia on 9/30/16.
//  Copyright © 2016 MizMattia. All rights reserved.
//

import Foundation
import UIKit
import OAuthSwift
import Fabric
import TwitterKit



class MetaSession{
    
    
    
    var twtSession : TWTRSession?;
    
    var oAuthSwiftTwitter : OAuth1Swift;
    var oAuthSwiftFacebook : OAuth2Swift;
    var oAuthSwiftLinkedin : OAuth1Swift;
    var oAuthSwiftInsta : OAuth2Swift;
    
    init(){
        self.twtSession = nil;
        oAuthSwiftTwitter = OAuth1Swift(
            consumerKey:    "********",
            consumerSecret: "********",
            requestTokenUrl: "https://api.twitter.com/oauth/request_token",
            authorizeUrl:    "https://api.twitter.com/oauth/authorize",
            accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
        )
        oAuthSwiftFacebook = OAuth2Swift(
            consumerKey:    "********",
            consumerSecret: "********",
            authorizeUrl:   "https://www.facebook.com/dialog/oauth",
            accessTokenUrl: "https://graph.facebook.com/oauth/access_token",
            responseType:   "code"
        )
        oAuthSwiftLinkedin = OAuth1Swift(
            consumerKey:    "********",
            consumerSecret: "********",
            requestTokenUrl: "https://api.linkedin.com/uas/oauth/requestToken",
            authorizeUrl:    "https://api.linkedin.com/uas/oauth/authenticate",
            accessTokenUrl:  "https://api.linkedin.com/uas/oauth/accessToken"
        )
        oAuthSwiftInsta = OAuth2Swift(

            consumerKey:    "********",
            consumerSecret: "********",
            authorizeUrl:   "https://api.instagram.com/oauth/authorize",
            responseType:   "token"
            // or
            // accessTokenUrl: "https://api.instagram.com/oauth/access_token",
            // responseType:   "code"

        )

    }
    
    
    
}
