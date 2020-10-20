//
//  ViewController.swift
//  Week2
//
//  Created by Phuoc Nguyen on 10/19/20.
//  Copyright © 2020 Phuoc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var retype: UITextField!
    @IBOutlet weak var birthdayInputbox: UITextField!
    @IBOutlet weak var birthdaySelectbox: UIDatePicker!
    @IBOutlet weak var genderPicker: UISwitch!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var hobbyPicker: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.delegate=self
        password.delegate=self
        retype.delegate=self
        birthdayInputbox.delegate=self
        
        password.isSecureTextEntry=true
        retype.isSecureTextEntry=true
    }
    
    func showAlert(Message:String) {
        let missMatchPassword = UIAlertController(title: "Error", message: Message, preferredStyle: .alert)
        
        missMatchPassword.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in NSLog(Message)}))
        
        present(missMatchPassword, animated: true, completion: nil)
    }
    func checkValidDate(Date:String) -> Bool {
        //dd/mm/yyyy
        let a=Date.split() {$0 == "/"}
        if(a.count != 3){
            return false
        }else{
            if a[0].count != 2||a[1].count != 2||a[2].count != 4{
               return false
            }
            if let x=Int(a[0]){
                if x>31{
                  return false
                }
            }
            if let x=Int(a[1]){
                if x>12 {
                    return false
                }
            }

            if let x=Int(a[2]){
                if x<1000||x>9999{
                    return false
                }
            }
        }
    
        return true
    }
    @IBAction func PickDay(_ sender: Any) {
        let formatter=DateFormatter()
        formatter.dateFormat="dd/MM/yyyy"
        let string_date:String = formatter.string(from:birthdaySelectbox.date )
        birthdayInputbox.text=string_date
    }
    
    @IBAction func okButtonClick(_ sender: Any) {
        
        if retype.text != password.text {
            showAlert(Message: "Retype Password Missmatched")
        }
        
        if !checkValidDate(Date: birthdayInputbox.text!) {
            showAlert(Message: "Invalid Date Format")
        }
    }
    
   
    @IBAction func resetButtonClick(_ sender: Any) {
        username.text=""
        password.text=""
        retype.text=""
        birthdayInputbox.text=""
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo" {
            let dest=segue.destination as! infoViewController
            dest.username = username.text!
            dest.password = password.text!
            
            let formatter=DateFormatter()
             formatter.dateFormat="dd/MM/yyyy"
             let string_date:String = formatter.string(from:birthdaySelectbox.date )
            dest.birthday = string_date
            
            if genderPicker.isOn {
                dest.gender = "Male"
            }else{
                dest.gender = "Female"
            }
            switch hobbyPicker.selectedSegmentIndex {
            case 1:
                dest.hobby = "Tennis"
            case 2:
                dest.hobby = "Badminton"
            case 3:
                dest.hobby = "Football"
            default:
                dest.hobby=""
            }
            
        }
    }
    
    
}

extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
