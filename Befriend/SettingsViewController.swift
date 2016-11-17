//
//  SettingsViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/15/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController{

    @IBAction func gotoFriendsBuutton(_ sender: Any) {
        performSegue(withIdentifier: "settings_to_friends", sender: self)
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        performSegue(withIdentifier: "settings_to_login", sender: self)
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
