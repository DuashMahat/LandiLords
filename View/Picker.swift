import UIKit


protocol pickerImage {
    func setImage (image : UIImage)
}

open class imagePicker : NSObject {
    private var pickercontroller = UIImagePickerController()
    var delegate : pickerImage?
    
}

extension imagePicker : UIImagePickerControllerDelegate {
    
}
