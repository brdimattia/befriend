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
        
        let appDelegate = UIApplication.shared.delegate as!AppDelegate
        
        @IBOutlet weak var usernameField: UITextField!
        
        @IBOutlet weak var passwordField: UITextField!
        
        @IBAction func loginButton(_ sender: Any) {
            
            if(usernameField.text != ""){
                if(passwordField.text != ""){
                    
                    var request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/login.php")!)
                    request.httpMethod = "POST"
                    let postString = "username=" + usernameField.text! + "&password=" + passwordField.text!;
                    request.httpBody = postString.data(using: .utf8)
                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        guard let data = data, error == nil else {
                            print("error=\(error)")
                            let alert = UIAlertController(title: "Error", message: "Username/Password is incorrect", preferredStyle: UIAlertControllerStyle.alert)
                            
                            // add an action (button)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                            
                            // show the alert
                            self.present(alert, animated: true, completion: nil)
                            return
                        }
                        
                        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                            print("statusCode should be 200, but is \(httpStatus.statusCode)")
                        }
                        
                        let responseString = String(data: data, encoding: .utf8)
                        //print("responseString = \(responseString)")
                        if(responseString == Optional("{\"success\":true}")){
                            OperationQueue.main.addOperation {
                                self.appDelegate.METASESSION.username = self.usernameField.text!
                                self.performSegue(withIdentifier:  "login_to_friends", sender: self)
                            }
                        }
                        else
                        {
                            print("error here")
                            let alert = UIAlertController(title: "Error", message: "Username/Password is incorrect", preferredStyle: UIAlertControllerStyle.alert)
                            
                            // add an action (button)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                            
                            // show the alert
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                    task.resume()
                    
                }
                else{
                    print("Must enter a password")
                    let alert = UIAlertController(title: "Error", message: "Username/Password is incorrect", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else{
                print("Must enter a username")
                let alert = UIAlertController(title: "Error", message: "Username/Password is incorrect", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            
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
