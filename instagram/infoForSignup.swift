//
//  infoForSignup.swift
//  instagram
//
//  Created by R82 on 05/08/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore


class infoForSignup: UIViewController,UINavigationControllerDelegate & UIImagePickerControllerDelegate{

    var ref: DatabaseReference!
    var refr: Firestore!

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reenterPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        refr = Firestore.firestore()
      
    }
    @IBAction func changePhotoButtonAction(_ sender: Any) {
        openGallery()
    }
    @IBAction func saveButtonAction(_ sender: Any) {
        fireStore()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profilePicture.image = info[.editedImage] as! UIImage
        dismiss(animated: true,completion: nil)
    }
    func openGallery(){
        let gallery = UIImagePickerController()
        gallery.delegate = self
        gallery.allowsEditing = true
        gallery.sourceType = .photoLibrary
        present(gallery, animated: true,completion: nil)
    }
    func fireStore(){
        refr.collection("iOS").document(Auth.auth().currentUser?.uid ?? "" ).setData(["E-Mail": emailAddressTextField.text!,"password": passwordTextField.text!])
    }
}
