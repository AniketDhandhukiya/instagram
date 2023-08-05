//
//  NewPost.swift
//  instagram
//
//  Created by R82 on 02/08/23.
//

import UIKit

class NewPost: UIViewController, UINavigationControllerDelegate & UIImagePickerControllerDelegate {

    @IBOutlet weak var ImageForUpload: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func gallaryButtonAction(_ sender: Any) {
        openGallery()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        ImageForUpload.image = info[.editedImage] as! UIImage
        dismiss(animated: true,completion: nil)
    }
    func openGallery(){
        let gallery = UIImagePickerController()
        gallery.delegate = self
        gallery.allowsEditing = true
        gallery.sourceType = .photoLibrary
        present(gallery, animated: true,completion: nil)
    }
}
