//
//  SignOutViewModel.swift
//  LandiLords
//
//  Created by Duash on 8/24/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

class SignOutViewModel: NSObject {

}

extension SignOutViewModel  {
    func signOutPossible (completion: @escaping (Bool) -> Void ) {
        FireBaseManager.shared.signOut { (bool) in
            if (bool == true) {
               completion(true)
            } else {
               completion(false)
            }
        }
    }
}
