//
//  ButtonBehaviours.swift
//  LandiLords
//
//  Created by Duash on 7/20/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

final class ButtonBehaviours: NSObject {
    let emailField : UITextField
    let passwordField: UITextField
    var onChangeEmail : (Bool) -> Void
    var onChangePassword : (Bool) -> Void
    
    init(emailField: UITextField , passwordField: UITextField , onChangeEmail: @escaping (Bool) -> Void , onChangePassword: @escaping (Bool)-> Void ) {
        self.emailField = emailField
        self.passwordField = passwordField
        self.onChangeEmail = onChangeEmail
        self.onChangePassword = onChangePassword
        super.init()
        setUp()
    }
    
    private func setUp() {
        emailField.addTarget(self, action: #selector(forEmailField(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(forPassField(_:)), for: .editingChanged)
        onChangePassword(false)
        onChangeEmail(false)
    }
    
    
    @objc func forEmailField (_ emailField: UITextField ) {
        var emailEnabled = true
        guard let text = emailField.text , !text.isEmpty else {
            emailEnabled = false
            return
        }
        onChangeEmail(emailEnabled)
    }
    
    
    @objc func forPassField (_ passwordField: UITextField ) {
        var passwordEnabled = true
        guard let text = passwordField.text , !text.isEmpty else {
            passwordEnabled = false
            return
        }
        onChangePassword(passwordEnabled)
    }
}
