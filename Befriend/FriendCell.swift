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
    
    var friendUsername: String? {
        didSet {
            username.text = friendUsername;
        }
    }
}
