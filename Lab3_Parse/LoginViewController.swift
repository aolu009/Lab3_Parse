//
//  ViewController.swift
//  Lab3_Parse
//
//  Created by Lu Ao on 10/26/16.
//  Copyright © 2016 Lu Ao. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("App starts")
        let currentUser = PFUser.current()
        if currentUser != nil {
            emailTextField.text = currentUser?.email
            passWordTextField.text = currentUser?.password
        } else {
            print("Show a message asking for login to user")
        }
    }
    
    
    @IBAction func signupPressed(_ sender: AnyObject) {
        signupMethod()
    }
    
    
    
    
    @IBAction func loginPressed(_ sender: AnyObject) {
        
        PFUser.logInWithUsername(inBackground: self.emailTextField.text!, password: self.passWordTextField.text!, block: {
            (success, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                print("Successfully logged in") //ChatViewController
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let nxtVC = storyboard.instantiateViewController(withIdentifier: "navChatViewController")
                self.present( nxtVC, animated: true, completion: nil)
            }
        })
    }
    
    
    func signupMethod() {
        let user = PFUser()
        print("Submitting User Info")
        user.username = self.emailTextField.text
        user.password = self.passWordTextField.text
        print("User Name:",user.username!)
        print("Password:",user.password!)
        user.signUpInBackground(block: {
            (success, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                user.username = "Louis"
                print("success")
                print("Here3")
            }
        })
    }
    
}

