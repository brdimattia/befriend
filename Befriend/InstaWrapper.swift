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

}
