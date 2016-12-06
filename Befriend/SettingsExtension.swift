//
//  SettingsExtension.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/21/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit


class SettingsExtension: UITableViewController{
    
    var viewParent : SettingsViewController
    let appDelegate = UIApplication.shared.delegate as!AppDelegate
    var request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/")!)
   
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    @IBAction func editedName(_ sender: Any) {
        request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/updateDisplayName.php")!)
        
        if(nameField.text != ""){
            
            let postString = "displayName=" + nameField.text! + "&username=" + appDelegate.METASESSION.username;
            
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
    }
    @IBOutlet weak var birthdayField: UITextField!
    @IBAction func editedBirthday(_ sender: Any) {
        
    }
    @IBOutlet weak var phoneField: UITextField!
    @IBAction func editedPhone(_ sender: Any) {
        request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/updatePhoneNum.php")!)
       
        if(phoneField.text != ""){
            
            let postString = "phoneNum=" + phoneField.text! + "&username=" + appDelegate.METASESSION.username;
            
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

    }
    @IBOutlet weak var emailField: UITextField!
    @IBAction func editedEmail(_ sender: Any) {
        request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/updateEmail.php")!)
        
        if(emailField.text != ""){
            
            let postString = "email=" + emailField.text! + "&username=" + appDelegate.METASESSION.username;
            
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

    }

    override init(style: UITableViewStyle){
        viewParent = SettingsViewController();
        super.init(style: style)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!){
        viewParent = SettingsViewController();
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        viewParent = SettingsViewController();
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getUserInfo()
    }
    
    @IBOutlet weak var nameCell: UITableViewCell!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                tableView.deselectRow(at:indexPath, animated: true)
                self.viewParent.showModal(type: "displayName");
            }
            else if (indexPath.row == 2) {
                tableView.deselectRow(at:indexPath, animated: true)
                self.viewParent.showModal(type: "phone");
                
            }
            else if (indexPath.row == 3) {
                tableView.deselectRow(at:indexPath, animated: true)
                self.viewParent.showModal(type: "email");
                
            }
        }
    }

func getUserInfo(){
    let appDelegate = UIApplication.shared.delegate as!AppDelegate
    
    self.usernameLabel.text = appDelegate.METASESSION.userStruct.username;
    self.nameField.text = appDelegate.METASESSION.userStruct.displayName;
    self.birthdayField.text = appDelegate.METASESSION.userStruct.birthday;
    self.phoneField.text = appDelegate.METASESSION.userStruct.phoneNum;
    self.emailField.text = appDelegate.METASESSION.userStruct.email;

}

}
