//
//  AddFriendViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/17/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit

class AddFriendViewController: UIViewController{
    
    @IBOutlet weak var unview: UIView!
    @IBOutlet weak var phview: UIView!
    @IBOutlet weak var cnview: UIView!
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBAction func addByUsernameButton(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! ModalViewController
        self.addChildViewController(popOverVC)
        
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @IBOutlet weak var phoneField: UITextField!
    @IBAction func addByPhoneButton(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! ModalViewController
        self.addChildViewController(popOverVC)
        
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    
    }
    
    
    @IBAction func addFromContactsButton(_ sender: Any) {
        performSegue(withIdentifier: "addfriends_to_addbycontacts", sender: self)
    }
    
    
    @IBAction func toSettingButton(_ sender: Any) {
        performSegue(withIdentifier: "addfriends_to_settings", sender: self)
    
    }
    
    
    @IBAction func toFriendsButton(_ sender: Any) {
        performSegue(withIdentifier: "addfriends_to_friends", sender: self)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let appDelegate = UIApplication.shared.delegate as!AppDelegate
        
        unview.layer.borderColor = UIColor.black.cgColor
        cnview.layer.borderColor = UIColor.black.cgColor
        phview.layer.borderColor = UIColor.black.cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
