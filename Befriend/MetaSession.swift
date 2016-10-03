//
//  MetaSession.swift
//  Befriend
//
//  Created by Ben DiMattia on 9/30/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit
import Fabric
import TwitterKit
import OAuthSwift


class MetaSession{
    
    
    
    var twtSession : TWTRSession?;
    
    var oAuthSwiftTwitter : OAuth1Swift;
    var oAuthSwiftFacebook : OAuth2Swift;
    
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
    }
    
    
    
}
