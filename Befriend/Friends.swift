//
//  Friends.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/10/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit

class Friends: NSObject {
    let friends: [Friend]
    
    init(friends: [Friend]) {
        self.friends = friends
    }
}

extension Friends: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return friends.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as! FriendCell
            let friend = friends[indexPath.row]
            cell.friendUsername = friend.username;
            return cell
        }
    
}
