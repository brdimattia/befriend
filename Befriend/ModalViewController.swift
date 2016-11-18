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
        drawerView.isHidden = true
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func detailButton(_ sender: Any) {
        if(drawerView.isHidden){
            showDetail()
        }
        else{
            hideDetail()
            
        }
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        self.removeAnimate()
        //self.view.removeFromSuperview()
    }

    @IBAction func backgroundButton(_ sender: Any) {
        self.removeAnimate()
        
    }

    func showDetail(){
        drawerView.isHidden = false
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.drawerView.center.y += self.drawerView.frame.size.height
        
        }, completion: { finished in
        })
        
    }
    
    func hideDetail(){
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            self.drawerView.center.y -= self.drawerView.frame.size.height
            
        }, completion: { finished in
            self.drawerView.isHidden = true
        })
        
        

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
