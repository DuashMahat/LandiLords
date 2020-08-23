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

final class FireBaseManage {
    let reference = Database.database().reference()
    let storage = Storage.storage().reference()
    static let shared = FileManager()
   
    private init() {}
    
    
}
