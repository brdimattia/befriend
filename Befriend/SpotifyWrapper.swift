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
    
    func followRequest(_ oauthswift: OAuth2Swift, screenName: String){
        let url = "https://api.spotify.com/v1/me/following?type=user&ids=" + screenName
        
        let _ =  oauthswift.client.put(url,
                                        success: { data, response in
                                            let dataString = String(data: data, encoding: String.Encoding.utf8)
                                            print("datastring", dataString ?? "Null")},
                                        failure: { error in
                                            print("the error is" , error)})
    }
}
