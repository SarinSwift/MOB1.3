//
//  ViewController.swift
//  CommunicationClass
//
//  Created by Adriana González Martínez on 1/31/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: ButtonLogin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        loginButton.dictionaryVal = ["Sarin": 20, "Someone": 24]
    }
    
    @objc func loginButtonPressed(sender: ButtonLogin){
        loginButton.tag = 0
        print(sender.dictionaryVal)
    }
}

