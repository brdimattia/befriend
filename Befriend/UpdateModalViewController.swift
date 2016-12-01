//
//  UpdateModalViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/21/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation

import UIKit

class UpdateModalViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func updateButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as!AppDelegate
        
        var request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/")!)
        var postString = "";
        
        if(titleLabel.text == "Update Display Name"){
            request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/updateDisplayName.php")!)
            postString = "displayName=" + textField.text! + "&username=" + appDelegate.METASESSION.username;
        }
        if(titleLabel.text == "Update Email Address"){
            request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/updateEmail.php")!)
            postString = "email=" + textField.text! + "&username=" + appDelegate.METASESSION.username;
        }
        if(titleLabel.text == "Update Phone Number"){
            request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/updatePhoneNum.php")!)
            postString = "phoneNum=" + textField.text! + "&username=" + appDelegate.METASESSION.username;
        }
        
        
        if(textField.text != ""){
            
            
            
            request.httpMethod = "POST"
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
                print("responseString = \(responseString)")
                }
            task.resume()
            
        }
        else{
            print("Must enter something")
        }

         
        self.removeAnimate()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.superview?.bringSubview(toFront: self.view)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        self.removeAnimate()
        //self.view.removeFromSuperview()
    }
    
    @IBAction func backgroundButton(_ sender: Any) {
        self.removeAnimate()
        
    }
    
    
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
       
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
}
