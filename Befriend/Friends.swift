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
    let friends: [String]
    
    init(friends: [String]) {
        self.friends = friends
    }
}

extension Friends: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FriendCell.self)) as! FriendCell
        let friend = friends[indexPath.row]
        cell.friendUsername = friend
        return cell
    }
}
