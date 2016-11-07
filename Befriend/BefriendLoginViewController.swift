//
//  BefriendLoginViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/7/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit

class BefriendLoginViewController: UIViewController{
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func loginButton(_ sender: Any) {
    performSegue(withIdentifier:  "login_to_friends", sender: self)
    
    }
    
    
    @IBAction func signupButton(_ sender: Any) {
        performSegue(withIdentifier: "login_to_signup", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //let appDelegate = UIApplication.shared.delegate as!AppDelegate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
