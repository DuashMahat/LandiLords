//
//  Reference.swift
//  LandiLords
//
//  Created by Duash on 8/23/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import  FirebaseStorage
import  FirebaseAuth
import SVProgressHUD

final class FireBaseManager {
    let reference = Database.database().reference()
    let storage = Storage.storage().reference()
    static let shared = FireBaseManager()
    private init() {}
}

extension FireBaseManager  {
   func signIn ( email : String  ,  password: String , completion: @escaping (Error?) -> () ) {
          Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
              if error != nil {
                  print(error?.localizedDescription ?? "Error Sign in")
                  completion(error)
              } else {
                 completion(nil)
              }
          }
      }
    
    
    func signUp (email : String , password: String , completion : @escaping (Error?) -> () )  {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
               print(error?.localizedDescription ?? "Error Sign in")
              completion(error)
            } else {
               completion(nil)
            }
        }
    }
}
