//
//  infoViewController.swift
//  Week2
//
//  Created by Phuoc Nguyen on 10/20/20.
//  Copyright © 2020 Phuoc Nguyen. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {
    
    var username:String=""
    var password:String=""
    var birthday:String=""
    var gender:String=""
    var hobby:String=""
    
    @IBOutlet weak var UsernameComponent: UITextField!
    @IBOutlet weak var PasswordComponent: UITextField!
    @IBOutlet weak var BirthdayComponent: UITextField!
    @IBOutlet weak var GenderComponent: UITextField!
    @IBOutlet weak var HobbyComponent: UITextField!
    @IBOutlet weak var BackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UsernameComponent.text=username
        PasswordComponent.isSecureTextEntry=true
        PasswordComponent.text=password
        BirthdayComponent.text=birthday
        GenderComponent.text=gender
        HobbyComponent.text=hobby
        // Do any additional setup after loading the view.
    }
    

    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
