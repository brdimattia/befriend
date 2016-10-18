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
    func followRequest(_ oauthswift: OAuth2Swift, screenName: String){
        var params = Dictionary<String, String>()
        params["outgoing_status:"] = "follows"
        params["screen_name"] = screenName
        let atoken = oauthswift.client.credential.oauthToken
        let url : String = "https://api.instagram.com/v1/users/179140613/relationship?access_token=" + atoken
        let _ =  oauthswift.client.post(url, parameters: params,
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
