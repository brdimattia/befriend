//
//  TwitterWrapper.swift
//  Befriend
//
//  Created by Danielle Misiaszek on 9/27/16.
//  Copyright © 2016 MizMattia. All rights reserved.
//

import Foundation
import UIKit
import Fabric
import TwitterKit
import OAuthSwift


class TwitterWrapper{
    
    
    
    func followRequest(_ oauthswift: OAuth1Swift){
        
        var params = Dictionary<String, String>()
        params["screen_name"] = "dmisiaszek"
        params["follow"] = "true"
        
        let _ = oauthswift.client.get("https://api.twitter.com/1.1/friendships/create.json?", parameters: params, headers: [:],
                              success: { data, response in
                                let dataString = String(data: data, encoding: String.Encoding.utf8)
                                print(dataString)
            },
                              failure: { error in
                                print(error)
            }
        )
        

        
      
//        var request = URLRequest(url: URL(string: "https://api.twitter.com/1.1/friendships/create.json?")!)
//        request.httpMethod = "POST"
//        let postString = "screen_name=dmisiaszek&follow=true"
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {                                       // check for fundamental networking error
//                print("error=\(error)")
//                return
//            }
//            
//            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
//                print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                print("response = \(response)")
//            }
//            
//            let responseString = String(data: data, encoding: .utf8)
//            print("responseString = \(responseString)")
//        }
//        task.resume()
//    }
}
}
