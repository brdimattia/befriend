//
//  BefriendSignupViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/8/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit

class BefriendSignupViewController: UIViewController{
    

    @IBOutlet weak var passwordfield1: UITextField!
    
    @IBOutlet weak var passwordfield2: UITextField!

    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBAction func signupButton(_ sender: Any) {
     performSegue(withIdentifier: "signup_to_tutorial", sender: self)
    
    }
    
    
    @IBAction func returnToLoginButton(_ sender: Any) {
        performSegue(withIdentifier: "signup_to_login", sender: self)
        
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
