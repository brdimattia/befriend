//
//  FacebookWrapper.swift
//  Befriend
//
//  Created by Ben DiMattia on 9/25/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation

class FacebookWrapper{
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            let data:[String:AnyObject] = result as! [String : AnyObject]
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = data["name"]! as! NSString
                print("User Name is: \(userName)")
                let userEmail : NSString = data["email"]! as! NSString
                print("User Email is: \(userEmail)")
            }
        })
    }

    
    
}
