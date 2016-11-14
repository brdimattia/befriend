//
//  Friend.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/11/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation

class Friend {
    
    var username : String = "";
    var phoneNumber : String = "";
    //address
    var addressStreet : String = "";
    var addressCity : String = "";
    var addressState : String = "";
    var addressZip : String = "";
    var facebookID : String = "";
    var instaID : String = "";
    var twitterID : String = "";
    var pinterestID : String = "";
    var spotifyID : String = "";
    var LinkedinID : String = "";
    
    init(username : String, phoneNumber : String, addressStreet : String, addressCity : String, addressState : String, addressZip : String){
     
        self.username = username;
        self.phoneNumber = phoneNumber;
        self.addressStreet = addressStreet;
        self.addressCity = addressCity;
        self.addressState = addressState;
        self.addressZip = addressZip;
        
    }
    
}
