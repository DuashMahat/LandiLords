//
//  UserViewController.swift
//  LandiLords
//
//  Created by Duash on 7/16/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastName: UILabel!
    let picker = UIImagePickerController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        forViewDidLoad()
    }
    @IBAction func editImage(_ sender: UIButton) {
       forSourceTypesAlerts()
    }
    
}


extension UserViewController  {
    func forViewDidLoad() {
        editButton.editButtoned()
        profileimage.beautify()
        container.backgroundColor  = .clear
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
    }
}

extension UserViewController {
    func forSourceTypesAlerts () {
        let alert = UIAlertController(title: "Choose Image from", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))

        alert.addAction(UIAlertAction(title: "Photo Gallery", style: .default, handler: { _ in
            self.openPhotoGallary()
        }))

        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    

}

extension UserViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
   
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           guard let imageEdited = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
               profileimage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
               return}
           profileimage.image = imageEdited
           dismiss(animated: true, completion: nil)
    }
    
    func  openCamera()   {
         if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
          {
              picker.sourceType = UIImagePickerController.SourceType.camera
              picker.allowsEditing = true
              self.present(picker, animated: true, completion: nil)
          }
          else
          {
              let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
              self.present(alert, animated: true, completion: nil)
          }
        }
        
    func openPhotoGallary() {
            picker.sourceType = UIImagePickerController.SourceType.photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true, completion: nil)
    }
}

