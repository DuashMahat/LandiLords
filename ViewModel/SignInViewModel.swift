//
//  SignInViewModel.swift
//  LandiLords
//
//  Created by Duash on 8/23/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

class SignInViewModel: NSObject {

}

extension SignInViewModel {
    func validateSignIn(email: String?, password: String?) -> Bool {
        if let email = email, !email.isEmpty, let password = password, !password.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func signIn ( email : String  , password: String  , completionHandler: @escaping (Error?) -> Void) {
        FireBaseManager.shared.signIn(email: email, password: password) { (error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error sign in")
               completionHandler(error)
            } else {
               completionHandler(nil)
            }
        }
    }
}
