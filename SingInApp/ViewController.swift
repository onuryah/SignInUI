//
//  ViewController.swift
//  SingInApp
//
//  Created by Ceren Çapar on 16.09.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPasswordAgain: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var viewHidder: UIView!
    var trueUserName : String = "Onuralp"
    var truePassword : String = "123"
    var email : String = "xonurx@gmail.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func checkButton(_ sender: Any) {
        if textFieldUserName.text == trueUserName && textFieldPassword.text == truePassword && textFieldPasswordAgain.text == email  {
            resultLabel.text = "Login oldun"
        } else if textFieldUserName.text != trueUserName && textFieldPassword.text == truePassword && textFieldPasswordAgain.text == email{
            resultLabel.text = "Check Your Username"
        } else if textFieldUserName.text == trueUserName && textFieldPassword.text != truePassword && textFieldPasswordAgain.text == email{
            resultLabel.text = "Check Your Password"
        } else if textFieldUserName.text == trueUserName && textFieldPassword.text == truePassword && textFieldPasswordAgain.text != email  {
            resultLabel.text = "Check Your Email"
        } else {
            resultLabel.text = "FATAL ERROR 404"
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        UserDefaults.standard.set(textFieldUserName.text, forKey: "username")
        UserDefaults.standard.set(textFieldPassword.text, forKey: "password")
        UserDefaults.standard.set(textFieldPasswordAgain.text, forKey: "email")
        
        if viewHidder.isHidden {
            viewHidder.isHidden = false
        } else {
            viewHidder.isHidden = true
}
        trueUserName = UserDefaults.standard.object(forKey: "username") as! String
        truePassword = UserDefaults.standard.object(forKey: "password") as! String
        email = UserDefaults.standard.object(forKey: "email") as! String
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        textFieldPassword.text = ""
        textFieldPasswordAgain.text = ""
        textFieldUserName.text = ""
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
        UserDefaults.standard.removeObject(forKey: "email")
        trueUserName = "Onuralp"
        truePassword = "123"
        email = "xonurx@gmail.com"
    }
    
    @IBAction func autofFillButton(_ sender: Any) {
        textFieldUserName.text = UserDefaults.standard.object(forKey: "username") as? String
        textFieldPassword.text = UserDefaults.standard.object(forKey: "password") as? String
        textFieldPasswordAgain.text = UserDefaults.standard.object(forKey: "email") as? String
    }
}

