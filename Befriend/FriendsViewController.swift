//
//  FriendsViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/10/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit

class FriendsViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    let dataSource: Friends
    
    required init?(coder aDecoder: NSCoder) {
        let friends = [
            "Ben", "Danielle", "Bob", "Shai", "Ralph", "Steve", "Mike", "Mark", "Ryan", "Olivia", "Matt"
        ]
        self.dataSource = Friends(friends: friends)
        super.init(coder: aDecoder)
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
