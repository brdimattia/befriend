//
//  FinishSignupViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/17/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit

class FinishSignupViewController: UIViewController{
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var birthdayField: UITextField!
    
    @IBAction func cameraButton(_ sender: Any) {
        print ("say cheese")
    }
    
    @IBAction func pinterestButton(_ sender: Any) {
        print("pinterest")
    }
    
    @IBAction func twitterButton(_ sender: Any) {
        print("twitter")
    }
    
    @IBAction func spotifyButton(_ sender: Any) {
        print("spotify")
    }

    @IBAction func submitButton(_ sender: Any) {
        performSegue(withIdentifier: "tutorial_to_friends", sender: self)
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
