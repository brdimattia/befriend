//
//  MainViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/6/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController{

    override func viewDidAppear(_ animated: Bool) {
        let isLogged = false;
        
        if(isLogged){
            performSegue(withIdentifier: "main_to_friends", sender: self)
        }
        else{
            performSegue(withIdentifier: "main_to_login", sender: self)
        }

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
