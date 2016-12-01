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

    @IBOutlet weak var usernameLabel: UILabel!
 
    @IBOutlet weak var displayNameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    var viewParent : SettingsViewController
    var userStruct : UserData;
    
    struct UserData {
        var username : String;
        var displayName : String;
        var birthday : String;
        var phoneNum : String;
        var email : String;
        var twitterID : String;
        var pinterestID : String;
        var spotifyID : String;
    }
    
    override init(style: UITableViewStyle){
        viewParent = SettingsViewController();
        userStruct = UserData(username: "", displayName: "", birthday: "", phoneNum: "", email: "", twitterID: "", pinterestID: "", spotifyID: "");
        super.init(style: style)
        self.getUserInfo()
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!){
        viewParent = SettingsViewController();
        userStruct = UserData(username: "", displayName: "", birthday: "", phoneNum: "", email: "", twitterID: "", pinterestID: "", spotifyID: "");
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.getUserInfo()
    }
    
    required init(coder aDecoder: NSCoder) {
        viewParent = SettingsViewController();
        userStruct = UserData(username: "", displayName: "", birthday: "", phoneNum: "", email: "", twitterID: "", pinterestID: "", spotifyID: "");
        super.init(coder: aDecoder)!
        self.getUserInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    var request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/getUserInfo.php")!)
    request.httpMethod = "POST"
    let postString = "username=" + appDelegate.METASESSION.username;
    request.httpBody = postString.data(using: .utf8)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print("error=\(error)")
            return
        }
        
        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
            print("statusCode should be 200, but is \(httpStatus.statusCode)")
        }
        
        let responseString = String(data: data, encoding: .utf8)!
        print("responseString = \(responseString)")
        
        let result = self.convertStringToDictionary(text: responseString)
        
        self.userStruct = UserData(username: String(describing: result!["username"]!),
                                  displayName: String(describing: result!["displayName"]!),
                                  birthday: String(describing: result!["birthday"]!),
                                  phoneNum: String(describing: result!["phoneNum"]!),
                                  email: String(describing: result!["email"]!),
                                  twitterID: String(describing: result!["twitterID"]!),
                                  pinterestID: String(describing: result!["pinterestID"]!),
                                  spotifyID: String(describing: result!["spotifyID"]!));
        
        self.usernameLabel.text = self.userStruct.username;
        self.displayNameLabel.text = self.userStruct.displayName;
        self.birthdayLabel.text = self.userStruct.birthday;
        self.phoneLabel.text = self.userStruct.phoneNum;
        self.emailLabel.text = self.userStruct.email;
        
    }
    
    task.resume()
    
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
