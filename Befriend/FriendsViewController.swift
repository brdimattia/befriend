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
        
        var request = URLRequest(url: URL(string: "http://cs.stonehill.edu/befriend/iphone_connect/getUserInfo.php")!)
        request.httpMethod = "POST"
        let postString = "username=" + self.appDelegate.METASESSION.username;
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
            }
            
            let responseString = String(data: data, encoding: .utf8)!
            print("responseString = \(responseString)")
            
            let result = self.convertStringToDictionary(text: responseString)
            
            self.appDelegate.METASESSION.userStruct.username = result!["username"]! as! String;
            self.appDelegate.METASESSION.userStruct.displayName = result!["displayName"]! as! String;
            self.appDelegate.METASESSION.userStruct.birthday =  result!["birthday"]! as! String;
            self.appDelegate.METASESSION.userStruct.phoneNum =  result!["phoneNum"]! as! String;
            self.appDelegate.METASESSION.userStruct.email = result!["email"]! as! String;
            self.appDelegate.METASESSION.userStruct.twitterID = result!["twitterID"]! as! String;
            self.appDelegate.METASESSION.userStruct.pinterestID =  result!["pinterestID"]! as! String;
            self.appDelegate.METASESSION.userStruct.spotifyID =  result!["spotifyID"]! as! String;
            
        }
        
        task.resume()

    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }


}
