//
//  ViewController.swift
//  Firechat
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextBox: UITextField!
    @IBOutlet weak var passwordTextBox: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    @IBAction func signUpButtonPressed(_ sender: Any) {
        guard let emailText = emailTextBox.text else {return}
        guard let pwText = passwordTextBox.text else {return}
        FirebaseManager.signUp(email: emailText, password: pwText)
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        guard let emailText = emailTextBox.text else {return}
        guard let pwText = passwordTextBox.text else {return}
        FirebaseManager.login(email: emailText, password: pwText) { (worked, error) in
            if worked {
                print("signed in")
            } else {
                guard let error = error else {return}
                print("ERROROROROROROOR", error)
                print("not signed in")
            }
        }
    }
    
    @IBAction func signOutButtonPressed(_ sender: Any) {
        FirebaseManager.logOut()
        }
}
