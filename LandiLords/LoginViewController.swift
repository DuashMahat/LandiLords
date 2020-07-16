//
//  ViewController.swift
//  LandiLords
//
//  Created by Duash on 7/16/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase
import SVProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var emailFields: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        forViewdidLoad()
    }
    
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailFields.text!, password: passwordField.text!) { (result, error) in
            SVProgressHUD.show()
            if error != nil {
                SVProgressHUD.showError(withStatus: "SignIn Error")
                print("error \(String(describing: error))")
            } else {
                SVProgressHUD.dismiss()
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                  guard let mainVc = storyBoard.instantiateViewController(identifier: "MainViewController") as? MainViewController else{return}
                self.navigationController?.pushViewController(mainVc, animated: true)
            }
        }
        
    }
    
    
    @IBAction func createAccountAction(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let signUpVc = storyBoard.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController else{return}
        navigationController?.pushViewController(signUpVc, animated: true)
    }
}

//MARK:- For viewDidLoad
extension LoginViewController {
    func forViewdidLoad() {
        emailFields.delegate = self
        passwordField.delegate = self
        emailFields.placeholder = "Enter your email"
        passwordField.placeholder = "Enter your password"
        emailFields.textAlignment = .center
        passwordField.textAlignment = .center
        passwordField.isSecureTextEntry = true
        navigationItem.title = "Login Page"
        SVProgressHUD.setForegroundColor(.black)
        SVProgressHUD.setBackgroundColor(.systemBlue)
    }
}

//MARK:- TextFieldDelegate
extension LoginViewController : UITextFieldDelegate  {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailFields.resignFirstResponder()
        passwordField.resignFirstResponder()
        return true
    }
}
