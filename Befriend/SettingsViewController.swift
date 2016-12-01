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

    
    @IBAction func goToFriendsButton(_ sender: Any) {
        performSegue(withIdentifier: "settings_to_friends", sender: self)
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        performSegue(withIdentifier: "settings_to_login", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet var settingView: UIView!
    func showModal(type: String){
        let popOverVC : UIViewController
        if(type == "displayName"){
            popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "displayNameSettingsPopUpID") as! UpdateModalViewController
        }
        else if(type == "phone"){
            popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "phoneSettingsPopUpID") as! UpdateModalViewController
        }
        else{
            popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "emailSettingsPopUpID") as! UpdateModalViewController
        }
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showSettingsTable") {
            let settingsExtension = segue.destination  as! SettingsExtension;
            settingsExtension.viewParent = self;
            // Pass data to secondViewController before the transition
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
