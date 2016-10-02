//
//  LoginViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 9/27/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit
import Fabric
import TwitterKit


class LoginViewController: UIViewController, FBSDKLoginButtonDelegate{
    
    
    
    
    @IBAction func facebookLoginButton(sender: AnyObject) {
        
        let facebookWrapper : FacebookWrapper =  FacebookWrapper()
        facebookWrapper.returnUserData()
        
        
    }
    
    @IBAction func twitterLoginButton(sender: AnyObject) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Twitter.sharedInstance().start(withConsumerKey: "QJGRPjBbsOTJXbojwbg2jBrK0", consumerSecret: "SpQ0bkorYmSA0Q16yhSKmn0Qg2AhY37p32wnBeCxlpNWkLUZlK")
        Fabric.with([Twitter.self()])
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                var twtSession = MetaSession.twitterSession(loginInstance : session!);
                print("signed in as \(session?.userName)");
            } else {
                print("error: \(error?.localizedDescription)");
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)

        
//        if (FBSDKAccessToken.current() != nil)
//        {
//            // User is already logged in, do work such as go to next view controller.
//            print("User Already Logged in")
//        }
//        else
//        {
//            let loginView : FBSDKLoginButton = FBSDKLoginButton()
//            self.view.addSubview(loginView)
//            loginView.center = self.view.center
//            loginView.readPermissions = ["public_profile", "email", "user_friends", "user_birthday", "user_managed_groups", "user_relationships", "user_work_history", "read_custom_friendlists"]
//            loginView.delegate = self
//        }
    }
    
    
    // Facebook Delegate Methods
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
            print(error)
        }
        else if result.isCancelled {
            // Handle cancellations
            print("user cancelled login")
        }
        else {
            //Checks if changes made by user to permissions allowed for future errors
            if result.grantedPermissions.contains("public_profile")
            {
                
                // Do work
            }else{
                
                //Handle
            }
            if result.grantedPermissions.contains("email")
            {
                
                // Do work
            }else{
                
                //Handle
            }
            if result.grantedPermissions.contains("user_friends")
            {
                
                // Do work
            }else{
                
                //Handle
            }
            if result.grantedPermissions.contains("user_birthday")
            {
                
                // Do work
            }else{
                
                //Handle
            }
            if result.grantedPermissions.contains("user_managed_groups")
            {
                
                // Do work
            }else{
                
                //Handle
            }
            if result.grantedPermissions.contains("user_relationships")
            {
                
                // Do work
            }else{
                
                //Handle
            }
            if result.grantedPermissions.contains("user_work_history")
            {
                
                // Do work
            }else{
                
                //Handle
            }
            if result.grantedPermissions.contains("read_custom_friendlists")
            {
                
                // Do work
            }else{
                
                //Handle
            }
        }
    }
    
    
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
