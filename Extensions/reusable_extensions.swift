//
//  reusable_extensions.swift
//  LandiLords
//
//  Created by Duash on 7/18/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation
import UIKit
extension UIButton {
    func beautify () {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 2
    }
}

extension UIImageView {
    func beautify() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.contentMode = .scaleAspectFit
        
    }
}
