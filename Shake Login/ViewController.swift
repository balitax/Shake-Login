//
//  ViewController.swift
//  Shake Login
//
//  Created by Agus Cahyono on 5/4/16.
//  Copyright © 2016 Agus Cahyono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txUsername: UITextField!
    @IBOutlet weak var txPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    

    var shakeAnimation = CABasicAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderColor : UIColor = UIColor(red: 232/255, green: 45/255, blue: 80/255, alpha: 1.0)
        self.txUsername.layer.borderColor = borderColor.CGColor
        self.txUsername.layer.borderWidth = 1.0
        self.txUsername.layer.cornerRadius = 5.0
        
        self.txPassword.layer.borderColor = borderColor.CGColor
        self.txPassword.layer.borderWidth = 1.0
        self.txPassword.layer.cornerRadius = 5.0
        
        btnLogin.addTarget(self, action: #selector(ViewController.shakedTextField(_:)), forControlEvents: .TouchUpInside)
    }
    
    /**
     Create shake animtion
     
     - parameter object: uitexfield
     */
    func createShakeAnimation(object: AnyObject) {
        shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.07
        shakeAnimation.repeatCount = 5
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = NSValue(CGPoint: CGPointMake(object.center.x - 10, object.center.y))
        shakeAnimation.toValue = NSValue(CGPoint: CGPointMake(object.center.x + 10, object.center.y))
        object.layer.addAnimation(shakeAnimation, forKey: "position")
    }

    /**
     Button login action
     
     - parameter sender: button login
     */
    func shakedTextField(sender: UIButton) {
        
        if txUsername.text?.isEmpty == true {
            createShakeAnimation(self.txUsername)
        } else if txPassword.text?.isEmpty == true {
            createShakeAnimation(self.txPassword)
        } else {
            txPassword.resignFirstResponder()
            createAlert("Success", msg: "Login form has filled!")
        }
    }
    
    /**
     Create alertview
     
     - parameter title: title of alert
     - parameter msg:   message of alert
     */
    func createAlert(title: String, msg: String) {
        let alertView = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
    }


}

