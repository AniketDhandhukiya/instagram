//
//  signupPage.swift
//  instagram
//
//  Created by R82 on 05/08/23.
//

import UIKit

class signInPage: UIViewController {

    @IBOutlet weak var phoneOrEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func loginButtonAction(_ sender: Any) {
        
        
        navigatioForLoginButton()
    }
    @IBAction func sighupButtonAction(_ sender: Any) {
        
    }
    
    func navigatioForLoginButton(){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "tabBar") as! tabBar
        navigationController?.pushViewController(navigate, animated: true)
    }
}
