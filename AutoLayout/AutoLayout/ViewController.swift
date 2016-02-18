//
//  ViewController.swift
//  AutoLayout
//
//  Created by LeeWong on 16/2/17.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!

    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    var security : Bool = false { didSet { updateUI() } }
    
    var loginUser : User? { didSet{ updateUI() } }
    
    private func updateUI() {
        if password.secureTextEntry {
            passwordLabel.text = "Passowrd"

        } else {
            passwordLabel.text = "security Entry Passowrd"
        
        }
        password.secureTextEntry = security
    }
    
    @IBAction func login() {
        loginUser = User.login(username.text ?? "", passwd: password.text ?? "")
        if loginUser {
            //login success
        }
    }
    @IBAction func toggleSecuryEntry(sender: AnyObject) {
        security = !security
    }
}

