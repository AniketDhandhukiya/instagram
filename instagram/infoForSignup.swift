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
    var userid = Auth.auth().currentUser?.uid
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
        //realTime(user: userNameTextField.text!)
       // fireStore()
        signUp()
        navigationForSaveButton()
        
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
    func realTime(user:String){
        ref.child("\(user)").childByAutoId() .setValue(["Name":nameTextField.text!,"Bio": bioTextField.text!,"Email": emailAddressTextField.text!,"ProfilePhoto":profilePicture.image?.description])
        print("done")
    }
    func navigationForSaveButton(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "tabBar") as! tabBar
        navigationController?.pushViewController(navigate, animated: true)
    }
//    func fireStore(){
//        self.refr.collection("User").document(userid).setData(["E-Mail": emailAddressTextField.text!,"Password": passwordTextField.text!])
//        }
    
    func signUp(){
        Auth.auth().createUser(withEmail: emailAddressTextField.text!, password: passwordTextField.text!) { [self] authResult, error in
            if error == nil{
                var uid = authResult?.user.uid
                refr.collection("User").document(uid!).setData(["E-Mail": emailAddressTextField.text!,"password": passwordTextField.text!,"name": nameTextField.text!,"username":userNameTextField.text!,"bio":bioTextField.text!])
            }
        }
    }
}
