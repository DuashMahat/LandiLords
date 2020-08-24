//
//  SignUpViewModel.swift
//  LandiLords
//
//  Created by Duash on 8/23/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

class SignUpViewModel: NSObject {

}



extension SignUpViewModel {
   func validateSignUp ( firstname : String? , lastname : String? , email: String? , password : String? ) -> Bool {
       if let firstname = firstname , !firstname.isEmpty  , let lastname = lastname , !lastname.isEmpty , let email = email , !email.isEmpty , let password = password , !password.isEmpty {
          return true
       } else {
         return false
       }
   }
   
    func signUp (firstname : String , lastname : String , email: String , password : String  , completion: @escaping (Error?) -> Void) {
        FireBaseManager.shared.signUp(email: email, password: password) { (error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error sign up")
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
    
}



