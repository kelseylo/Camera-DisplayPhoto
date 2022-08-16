//
//  ViewController.swift
//  Camera&DisplayPhoto
//
//  Created by Kelsey Lo on 8/16/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var newlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func choosePhotoTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary //opens photo library
        
        present(imagePicker, animated: true, completion: nil )
    }
    
    @IBAction func takeSelfTapped(_ sender: Any) {
        imagePicker.sourceType = .camera //opens camera
        present(imagePicker, animated:true, completion: nil)
        
    }
    
    @IBOutlet weak var displayImage: UIImageView!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //update the photo with the selected photo
        
        //go back to our ViewController so the user can SEE the update
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            displayImage.image = selectedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
}

