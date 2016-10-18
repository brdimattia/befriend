//
//  FacebookWrapper.swift
//  Befriend
//
//  Created by Ben DiMattia on 9/25/16.
//  Copyright © 2016 MizMattia. All rights reserved.
//

import Foundation
import OAuthSwift

class FacebookWrapper{
    
    func friendRequest(_ oauthswift: OAuth2Swift){
        let _ = oauthswift.client.get(
            "https://graph.facebook.com/me?",
            success: { data, response in
                let dataString = String(data: data, encoding: String.Encoding.utf8)
                print(dataString)
            }, failure: { error in
                print(error)
            }
        )
    }


    
    
}
