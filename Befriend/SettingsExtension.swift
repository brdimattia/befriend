//
//  SettingsExtension.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/21/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit
import OAuthSwift


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
        request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/updateBirthday.php")!)
        
        if(birthdayField.text != ""){
            
            let postString = "birthday=" + birthdayField.text! + "&username=" + appDelegate.METASESSION.username;
            
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
    
    @IBOutlet weak var twitterSwitchOutlet: UISwitch!
    @IBAction func twitterSwitch(_ sender: Any) {
        //LOGIN TO TWITTER
        
        // create an instance and retain it
        
        let otoswift = OAuth1Swift(
            consumerKey:    "5CKNUpJHS116KSHiyR5Y1Q305",
            consumerSecret: "B8votVYdSPFp5jJqIPdsKQjlF0jmXbWZVIBNZ3FLIac2ZFGV8u",
            requestTokenUrl: "https://api.twitter.com/oauth/request_token",
            authorizeUrl:    "https://api.twitter.com/oauth/authorize",
            accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
        )
        otoswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: otoswift)
        let _ = otoswift.authorize(
            withCallbackURL: URL(string: "befriend://oauth-callback/twitter")!,
            success: { credential, response, parameters in
                print("Authenticted with Service <Twitter>")
                //let twtrWrapper : TwitterWrapper = TwitterWrapper()
                //twtrWrapper.followRequest(appDelegate.METASESSION.oAuthSwiftTwitter, screenName: "BefriendBen");
        },
            failure: { error in
                print("Twitter error is: " , error.localizedDescription)
        }
        )
        appDelegate.METASESSION.oAuthSwiftTwitter = otoswift;
    }
    
    @IBOutlet weak var spotifySwitchOutlet: UISwitch!
    @IBAction func spotifySwitch(_ sender: Any) {
        let ososwift = OAuth2Swift(
            consumerKey:    "f579ad7c67a74afb8e88a10c96978b96",
            consumerSecret: "ff97a193f8ac40bb92e7afa0bd44eea0",
            authorizeUrl:   "https://accounts.spotify.com/en/authorize",
            accessTokenUrl: "https://accounts.spotify.com/api/token",
            responseType:   "code"
        )
        ososwift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: ososwift)
        let state = generateState(withLength: 20)
        
        let _ = ososwift.authorize(
            withCallbackURL: URL(string: "befriend://oauth-callback/spotify")!,
            scope: "user-follow-modify", state: state,
            success: { credential, response, parameters in
                print("Authenticted with Service <Spotify>")
                self.appDelegate.METASESSION.oAuthSwiftSpotify = ososwift;
                let spWrapper : SpotifyWrapper = SpotifyWrapper()
                spWrapper.followRequest(self.appDelegate.METASESSION.oAuthSwiftSpotify, screenName: "danimiz")
                
        },
            failure: { error in
                print("Spotify error is: ",error)
        }
        )

    }
    
    @IBOutlet weak var pinterestSwitchOutlet: UISwitch!
    @IBAction func pinterestSwitch(_ sender: Any) {
        let oposwift = OAuth2Swift(
            consumerKey:    "4865149026609146368",
            consumerSecret: "04aec88e9552d5c8342d19f15ed9b7da708ec086f54527a0dc5f9f6bb282935c",
            authorizeUrl:   "https://api.pinterest.com/oauth/",
            accessTokenUrl: "https://api.pinterest.com/v1/oauth/token",
            responseType:   "code",
            contentType: "authorization_code"
        )
        oposwift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oposwift)
        let state = generateState(withLength: 20)
        
        let _ = oposwift.authorize(
            withCallbackURL: URL(string: "https://befriend-mizmattia.herokuapp.com/callback/pinterest")!,
            scope: "write_relationships", state: state,
            success: { credential, response, parameters in
                print("Authenticted with Service <Pinterest>")
                self.appDelegate.METASESSION.oAuthSwiftPinterest = oposwift;
                let piWrapper : PinterestWrapper = PinterestWrapper()
                piWrapper.followRequest(self.appDelegate.METASESSION.oAuthSwiftPinterest, screenName: "foodnetwork")
                
        },
            failure: { error in
                print("Pinterest error is: ",error)
        }
        )

    }
    

}
