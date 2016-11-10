//
//  FriendCell.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/10/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit

class FriendCell: UITableViewCell {
    
    @IBOutlet weak var username: UILabel!

    @IBAction func gotoFriend(_ sender: Any) {
        
        print(username.text ?? "username");
    }
    
    var friendUsername: String? {
        didSet {
            username.text = friendUsername;
        }
    }
}
