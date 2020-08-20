//
//  ViewController.swift
//  LandiLords
//
//  Created by Duale on 7/16/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase
import SVProgressHUD
import TWMessageBarManager
class LoginViewController: UIViewController {
    public enum navTitle {
       static let title = "Login Page"
    }
    @IBOutlet weak var emailFields: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createBtn: UIButton!
    private var buttonBehavior : ButtonBehaviours!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBehavior = ButtonBehaviours(emailField: emailFields, passwordField: passwordField, onChangeEmail: { [unowned self] emailEnabled in
            if emailEnabled {
                self.loginBtn.isEnabled = true
                self.loginBtn.alpha = 1
            } else {
                self.loginBtn.isEnabled = false
                self.loginBtn.alpha = 0.6
            }
        }, onChangePassword: { [unowned self] passwordEnabled in
             if passwordEnabled {
                self.loginBtn.isEnabled = true
                self.loginBtn.alpha = 1
                        } else {
                self.loginBtn.isEnabled = false
                self.loginBtn.alpha = 0.6
        }
        })
        forViewdidLoad()
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailFields.text!, password: passwordField.text!) { (result, error) in
            SVProgressHUD.show()
            if error != nil {
                SVProgressHUD.showError(withStatus:  error!.localizedDescription)
                print("error \(String(describing: error))")
            } else {
                SVProgressHUD.dismiss()
                let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainTbController")
                self.appDelegate.window?.rootViewController = initialViewController
                self.appDelegate.window?.makeKeyAndVisible()
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
        loginBtn.beautify()
        createBtn.beautify()
      
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


//Optional(Error Domain=FIRAuthErrorDomain Code=17008 "The email address is badly formatted." UserInfo={NSLocalizedDescription=The email address is badly formatted., FIRAuthErrorUserInfoNameKey=ERROR_INVALID_EMAIL})
