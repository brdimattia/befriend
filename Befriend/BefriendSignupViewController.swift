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
    
    let appDelegate = UIApplication.shared.delegate as!AppDelegate
    
    @IBAction func signupButton(_ sender: Any) {
        if(usernameField.text != ""){
            if(passwordfield1.text != "" && passwordfield2.text != ""){
                if(passwordfield1.text == passwordfield2.text){
                    var request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/checkavailable.php")!)
                    request.httpMethod = "POST"
                    let postString = "username=" + usernameField.text! + "&password=" + passwordfield1.text!
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
                                
                            self.appDelegate.METASESSION.username = self.usernameField.text!
                            self.appDelegate.METASESSION.password = self.passwordfield1.text!;
                            self.performSegue(withIdentifier: "signup_to_tutorial", sender: self)
                            }
                        }
                        else{
                            OperationQueue.main.addOperation {
                                let alert = UIAlertController(title: "Error", message: "Username already taken. Please choose another.", preferredStyle: UIAlertControllerStyle.alert)
                            
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
                    print("Passwords do not match")
                    passwordfield2.text = ""
                    passwordfield1.text = ""
                    usernameField.text = ""
                    let alert = UIAlertController(title: "Error", message: "Passwords do not match.", preferredStyle: UIAlertControllerStyle.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
            }
            else{
                print("Must Provide a password")
                passwordfield2.text = ""
                passwordfield1.text = ""
                usernameField.text = ""
                let alert = UIAlertController(title: "Error", message: "You must provide a password.", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
        else{
            print("Must Provide a Username")
            passwordfield2.text = ""
            passwordfield1.text = ""
            usernameField.text = ""
            let alert = UIAlertController(title: "Error", message: "You must provide a username.", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
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
    
func convertStringToDictionary(text: String) -> [String:AnyObject]? {
    if let data = text.data(using: String.Encoding.utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
        } catch let error as NSError {
                print(error)
        }
    }
    return nil
}


}
