//
//  MainViewController.swift
//  LandiLords
//
//  Created by Duash on 7/16/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logOutAction(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
              let storyBoard = UIStoryboard(name: "Main", bundle: nil)
              guard let loginVc = storyBoard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else{return}
            navigationController?.pushViewController(loginVc, animated: true)
        }
        catch {
            
        }
    }
}


