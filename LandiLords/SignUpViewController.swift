//
//  SignUpViewController.swift
//  LandiLords
//
//  Created by Duash on 7/16/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import SVProgressHUD
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signup: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        forViewDidLoad()
    }
    @IBAction func signUpAction(_ sender: UIButton) {
         SVProgressHUD.show()
              Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
                  if error != nil {
                      print(error!)
                  } else {
                      print("Registered")
                      SVProgressHUD.dismiss()
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                      guard let mainVc = storyBoard.instantiateViewController(identifier: "MainViewController") as? MainViewController else{return}
                    self.navigationController?.pushViewController(mainVc, animated: true)
                  }
              }
    }
}

extension SignUpViewController {
    func forViewDidLoad() {
        navigationItem.title = "Sign Up"
        firstName.delegate = self
        email.delegate = self
        password.delegate = self
        lastName.delegate = self
        firstName.placeholder = "First Name"
        lastName.placeholder = "Last Name"
        email.placeholder = "Email"
        password.placeholder = "Password"
        firstName.textAlignment = .center
        lastName.textAlignment = .center
        password.textAlignment = .center
        password.isSecureTextEntry = true
        email.textAlignment = .center
        SVProgressHUD.setForegroundColor(.black)
        SVProgressHUD.setBackgroundColor(.systemBlue)
    }
}


extension SignUpViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstName.resignFirstResponder()
        email.resignFirstResponder()
        lastName.resignFirstResponder()
        password.resignFirstResponder()
        return true
    }
}

extension SignUpViewController {
    
}

