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
    
    let appDelegate = UIApplication.shared.delegate as!AppDelegate
    
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
        let username = appDelegate.METASESSION.username
        let password = appDelegate.METASESSION.password;
        let displayName = nameField.text!;
        let birthday = birthdayField.text!;
        let phoneNum = phoneField.text!;
        let email = emailField.text!;
        let twitterID = "";
        let pinterestID = "";
        let spotifyID = "";
        let friends = "";
        
        if(displayName != ""){
            if(birthday != ""){
                if(phoneNum != ""){
                    if(email != ""){
                        
                        var request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/register.php")!)
                        request.httpMethod = "POST"
                        let postString = "username=" + username + "&password=" + password + "&displayName=" + displayName + "&birthday=" + birthday + "&phoneNum=" + phoneNum + "&email=" + email + "&twitterID=" + twitterID + "&pinterestID=" + pinterestID + "&spotifyID=" + spotifyID + "&friends=" + friends
                        request.httpBody = postString.data(using: .utf8)
                        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                            guard let data = data, error == nil else {
                                print("error=\(error)")
                                return
                            }
                            
                            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                            }
                            
                            let responseString = String(data: data, encoding: .utf8)
                            //print("responseString = \(responseString)")
                            if(responseString == Optional("{\"success\":true}")){
                                OperationQueue.main.addOperation {
                                    self.appDelegate.METASESSION.password = "";
                                    self.performSegue(withIdentifier: "tutorial_to_friends", sender: self)
                                }
                            }
                            else
                            {
                                OperationQueue.main.addOperation {
                                    let alert = UIAlertController(title: "Oops", message: "Something went wrong. Please make sure all information is entered correctly.", preferredStyle: UIAlertControllerStyle.alert)
                                    
                                    // add an action (button)
                                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                                    
                                    // show the alert
                                    self.present(alert, animated: true, completion: nil)
                                }
                            }
                        }
                        task.resume()
                        
                    }
                    else{
                        print("Must enter an email")
                        let alert = UIAlertController(title: "Error", message: "You must provide an email address.", preferredStyle: UIAlertControllerStyle.alert)
                        
                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        
                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                else{
                    print("Must enter a phone number")
                    let alert = UIAlertController(title: "Error", message: "You must provide a phone number.", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else{
                print("Must enter a birthday")
                let alert = UIAlertController(title: "Error", message: "You must enter your birthday.", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
        else{
            print("Must enter a display name")
            let alert = UIAlertController(title: "Error", message: "You must enter a display name.", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
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
