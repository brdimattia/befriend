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
    
    var oAuthSwift : OAuth1Swift;
    
    init(){
        self.twtSession = nil;
        oAuthSwift = OAuth1Swift(
            consumerKey:    "********",
            consumerSecret: "********",
            requestTokenUrl: "https://api.twitter.com/oauth/request_token",
            authorizeUrl:    "https://api.twitter.com/oauth/authorize",
            accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
        )
    }
    
    
    
}
