//
//  ModalViewController.swift
//  Befriend
//
//  Created by Ben DiMattia on 11/17/16.
//  Copyright © 2016 MisMattia. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {


    @IBOutlet weak var drawerView: UIView!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var displayName: UILabel!
    
    @IBAction func addFriendButton(_ sender: Any) {
        self.removeAnimate()
    }
    
    @IBOutlet weak var username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var detailButtonText: UIButton!

    
    @IBAction func closePopUp(_ sender: Any) {
        self.removeAnimate()
        //self.view.removeFromSuperview()
    }

    @IBAction func backgroundButton(_ sender: Any) {
        self.removeAnimate()
        
    }

    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
