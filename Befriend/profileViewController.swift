
//
//  ProfileViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/11/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    
    let appDelegate = UIApplication.shared.delegate as!AppDelegate
    var username : String = "";
    var phoneNumber : String = "";
    var addressStreet : String = "";
    var addressCity : String = "";
    var addressState : String = "";
    var addressZip : String = "";
    var facebookID : String = "";
    var instaID : String = "";
    var twitterID : String = "";
    var pinterestID : String = "";
    var spotifyID : String = "";
    var LinkedinID : String = "";
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        username = appDelegate.friendToPass.username;
        name.text = username
        usernameLabel.text = username
        phoneNumber = appDelegate.friendToPass.phoneNumber
        phoneNumLabel.setTitle(phoneNumber, for: .normal)
        addressStreet = appDelegate.friendToPass.addressStreet
        addressCity = appDelegate.friendToPass.addressCity
        addressState = appDelegate.friendToPass.addressState
        addressZip = appDelegate.friendToPass.addressZip
        addressTop.text = addressStreet
        addressBottom.text = addressCity + " " + addressState + " " + addressZip
        facebookID = appDelegate.friendToPass.facebookID
        instaID = appDelegate.friendToPass.instaID
        twitterID = appDelegate.friendToPass.twitterID
        pinterestID = appDelegate.friendToPass.pinterestID
        spotifyID = appDelegate.friendToPass.spotifyID
        LinkedinID = appDelegate.friendToPass.LinkedinID
        
        
    }
    
    @IBOutlet weak var proPic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UIButton!
    @IBOutlet weak var addressTop: UILabel!
    @IBOutlet weak var addressBottom: UILabel!
    
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "profile_to_friends", sender: self)
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
