//
//  SettingsExtension.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/21/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit


class SettingsExtension: UITableViewController{

    @IBOutlet weak var usernameLabel: UILabel!
 
    @IBOutlet weak var displayNameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    var viewParent : SettingsViewController
   

    override init(style: UITableViewStyle){
        viewParent = SettingsViewController();
        super.init(style: style)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!){
        viewParent = SettingsViewController();
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        viewParent = SettingsViewController();
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getUserInfo()
    }
    
    @IBOutlet weak var nameCell: UITableViewCell!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                tableView.deselectRow(at:indexPath, animated: true)
                self.viewParent.showModal(type: "displayName");
            }
            else if (indexPath.row == 2) {
                tableView.deselectRow(at:indexPath, animated: true)
                self.viewParent.showModal(type: "phone");
                
            }
            else if (indexPath.row == 3) {
                tableView.deselectRow(at:indexPath, animated: true)
                self.viewParent.showModal(type: "email");
                
            }
        }
    }

func getUserInfo(){
    let appDelegate = UIApplication.shared.delegate as!AppDelegate
    
    self.usernameLabel.text = appDelegate.METASESSION.userStruct.username;
    self.displayNameLabel.text = appDelegate.METASESSION.userStruct.displayName;
    self.birthdayLabel.text = appDelegate.METASESSION.userStruct.birthday;
    self.phoneLabel.text = appDelegate.METASESSION.userStruct.phoneNum;
    self.emailLabel.text = appDelegate.METASESSION.userStruct.email;
}

}
