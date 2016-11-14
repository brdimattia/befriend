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
    let appDelegate = UIApplication.shared.delegate as!AppDelegate
    let dataSource: Friends
    let friends : [Friend]

    required init?(coder aDecoder: NSCoder) {
        friends = [
            Friend(username: "Ben", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Danielle", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Bob", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Shai", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Ralph", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Steve", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Mike", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Mark", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Ryan", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Olivia", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Matt", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Brandon", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Michael", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Matt", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Armaly", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Matt", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Brandon", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Michael", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Matt", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Armaly", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Matt", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Brandon", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Michael", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Matt", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176"),
            Friend(username: "Armaly", phoneNumber: "6177979203", addressStreet: "34 Glendale Ave", addressCity: "Melrose", addressState: "MA", addressZip: "02176")
        ]
        self.dataSource = Friends(friends: friends)
        super.init(coder: aDecoder)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        performSegue(withIdentifier: "friends_to_settings", sender: self)
    }
    @IBAction func addButton(_ sender: Any) {
        
        performSegue(withIdentifier: "friends_to_addfriends", sender: self)
    }
    
}


// MARK: UIViewController
extension FriendsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            let row = indexPath.row
            
            
            
            appDelegate.friendToPass = friends[row]
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.performSegue(withIdentifier: "friends_to_viewprofile", sender: topController)
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 109
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = dataSource
        tableView.reloadData()
        tableView.delegate = self;
    }
    

}
