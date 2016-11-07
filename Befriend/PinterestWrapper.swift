//
//  PinterestWrapper.swift
//  Befriend
//
//  Created by Ben DiMattia on 10/30/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit
import OAuthSwift

class PinterestWrapper{
    
    func followRequest(_ oauthswift: OAuth2Swift, screenName: String){
        let url = "https://api.pinterest.com/v1/me/following/users/?user=" + screenName
        
        let _ =  oauthswift.client.post(url,
                                       success: { data, response in
                                        let dataString = String(data: data, encoding: String.Encoding.utf8)
                                        print("datastring", dataString ?? "Null")},
                                       failure: { error in
                                        print("the error is" , error)})
    }
}
