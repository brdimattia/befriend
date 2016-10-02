//
//  MetaSession.swift
//  Befriend
//
//  Created by Ben DiMattia on 9/30/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import Foundation
import UIKit
import Fabric
import TwitterKit


class MetaSession{
    
    
    struct twitterSession {
        var session : TWTRSession? = nil;
        init(loginInstance : TWTRSession ) {
            session = loginInstance
        }
    }
    
}
