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


class TwitterWrapper{
    
//    func logIn(){
//        Twitter.sharedInstance().start(withConsumerKey: "QJGRPjBbsOTJXbojwbg2jBrK0", consumerSecret: "SpQ0bkorYmSA0Q16yhSKmn0Qg2AhY37p32wnBeCxlpNWkLUZlK")
//        Fabric.with([Twitter.self()])
//        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
//            if (session != nil) {
//                print("signed in as \(session?.userName)");
//            } else {
//                print("error: \(error?.localizedDescription)");
//            }
//        })
//        logInButton.center = self.view.center
//        self.view.addSubview(logInButton)
//    }
    
    
    func followRequest(){
//        var request = URLRequest(url: URL(string: "https://api.twitter.com/1.1/friendships/create.json?")!)
//        request.httpMethod = "POST"
//        let postString = "screen_name=BefriendDani&follow=true"
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {                                                 // check for fundamental networking error
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
    }
}
