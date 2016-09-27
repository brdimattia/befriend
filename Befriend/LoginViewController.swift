//
//  LoginViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 9/27/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation


class LoginViewController: UIViewController, FBSDKLoginButtonDelegate{
    
    
    
    
    @IBAction func facebookLoginButton(sender: AnyObject) {
        
        
    }
    
    @IBAction func twitterLoginButton(sender: AnyObject) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FBSDKAccessToken.current() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
            print("User Already Logged in")
        }
        else
        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends", "user_birthday", "user_managed_groups", "user_relationships", "user_work_history", "read_custom_friendlists", ]
            loginView.delegate = self
        }
    }
    
    
    // Facebook Delegate Methods
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
