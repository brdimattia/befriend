//
//  ContactsViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/17/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit

class ContactsViewController: UIViewController{
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "addbycontacts_to_addfriends", sender: self)
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
