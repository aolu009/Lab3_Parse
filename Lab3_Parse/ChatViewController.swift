//
//  ChatViewController.swift
//  Lab3_Parse
//
//  Created by Lu Ao on 10/27/16.
//  Copyright © 2016 Lu Ao. All rights reserved.
//

import UIKit
import Parse


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var message: UITextField!
    @IBOutlet weak var savedMessageTable: UITableView!
    var textInCell : Array? = [String]()
    var userNameText : Array? = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = PFQuery(className:"Messages")
        query.whereKeyExists("messageSent")
        query.findObjectsInBackground {
            (objects, error) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) messages.")
                // Do something with the found objects
                if let objects = objects {
                    self.textInCell = [String]()
                    for object in objects {
                        print(object["messageSent"])
                        self.textInCell?.append(object["messageSent"] as! String)
                    }
                    //self.savedMessageTable.reloadData()
                }
            }
            else {
                print("Error: \(error!) ")
            }
        }
        let userNameQeuery = PFQuery(className:"Messages")
        userNameQeuery.whereKeyExists("userName")
        userNameQeuery.findObjectsInBackground {
            (objects, error) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) messages.")
                // Do something with the found objects
                if let objects = objects {
                    self.userNameText = [String]()
                    for object in objects {
                        print(object["userName"])
                        self.userNameText?.append(object["userName"] as! String)
                        //print(object["messageSent"])
                    }
                    self.savedMessageTable.reloadData()
                }
            } else {
                print("Error: \(error!) ")
            }
        }
       Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ChatViewController.onTimer), userInfo: nil, repeats: true)

    }

    @IBAction func sendPressed(_ sender: AnyObject) {
        let message = PFObject(className: "Messages")
        let userName = PFObject(className: "Messages")
        let currentUser = PFUser.current()
        if let messagetext = self.message.text{
            message["messageSent"] = messagetext
        }
        else{
            message["messageSent"] = "N/A"
        }
        if let usernameText = currentUser?.username!{
            userName["userName"] = usernameText
        }
        else{
            userName["userName"] =  "N/A"
        }
        message.saveInBackground(block: {
            (success, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                print("Successfully Saved")
                NSLog("Success Log: \(success)")
            }
        })
        userName.saveInBackground(block: {
            (success, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                print("Successfully Saved")
                NSLog("Success Log: \(success)")
            }
        })
        //Quering all message into an Array
        let Messageuery = PFQuery(className:"Messages")
        Messageuery.whereKeyExists("messageSent")
        Messageuery.findObjectsInBackground {
            (objects, error) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) messages.")
                // Do something with the found objects
                if let objects = objects {
                    self.textInCell = [String]()
                    for object in objects {
                        print(object["messageSent"])
                        self.textInCell?.append(object["messageSent"] as! String)
                        //print(object["messageSent"])
                    }
                    self.savedMessageTable.reloadData()
                }
            } else {
                print("Error: \(error!) ")
            }
        }
        let userNameQeuery = PFQuery(className:"Messages")
        userNameQeuery.whereKeyExists("userName")
        userNameQeuery.findObjectsInBackground {
            (objects, error) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) messages.")
                // Do something with the found objects
                if let objects = objects {
                    self.userNameText = [String]()
                    for object in objects {
                        print(object["userName"])
                        self.userNameText?.append(object["userName"] as! String)
                        //print(object["messageSent"])
                    }
                    self.savedMessageTable.reloadData()
                }
            } else {
                print("Error: \(error!) ")
            }
        }
    }
    
    //Setting up tableview attribute
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textInCell!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentUser = PFUser.current()
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedMessageTableViewCell") as! SavedMessageTableViewCell
        cell.messageText.text = self.textInCell?[(self.textInCell?.count)! - indexPath.row - 1]
        cell.usernameText.text = currentUser?.username
        return cell
    }
    
    
    
    func onTimer() {
        let query = PFQuery(className:"Messages")
        query.whereKeyExists("messageSent")
        query.findObjectsInBackground {
            (objects, error) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) messages.")
                // Do something with the found objects
                if let objects = objects {
                    self.textInCell = [String]()
                    for object in objects {
                        print(object["messageSent"])
                        self.textInCell?.append(object["messageSent"] as! String)
                    }
                    self.savedMessageTable.reloadData()
                }
            }
            else {
                print("Error: \(error!) ")
            }
        }
    }
    
}
