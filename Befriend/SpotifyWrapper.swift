//
//  SpotifyWrapper.swift
//  Befriend
//
//  Created by Danielle Misiaszek on 10/18/16.
//  Copyright © 2016 MizMattia. All rights reserved.
//

import Foundation
import UIKit
import OAuthSwift

class SpotifyWrapper{
    
    func followRequest(_ oauthswift: OAuth1Swift, screenName: String){
    //    var params = Dictionary<String, String>()
//        params["follow"] = "true"
  //      params["screen_name"] = screenName
        let _ =  oauthswift.client.post("https://api.twitter.com/1.1/friendships/create.json", parameters: params,
                                        success: { data, response in
                                            let dataString = String(data: data, encoding: String.Encoding.utf8)
                                            print("datastring", dataString)},
                                        failure: { error in
                                            print("the error is" , error)})
    }
}
