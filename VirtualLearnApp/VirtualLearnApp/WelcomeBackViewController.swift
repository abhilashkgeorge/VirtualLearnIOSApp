//
//  WelcomeBackViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 08/04/22.
//

import UIKit

class WelcomeBackViewController: UIViewController {

    @IBOutlet weak var loginUsername: FloatingLabel!
    @IBOutlet weak var loginPassword: FloatingLabel!
    var viewmodel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func welcomeBackLoginTapped(_ sender: Any) {
        
        viewmodel.loginOfUser(username: loginUsername.text ?? "deeksha1", password: loginPassword.text ?? "Deeksha12",completion: {
            (tokenMsg: String) -> Void
            in
            if tokenMsg == "Invalid credential or password" || tokenMsg == ""{
                print("Invalid credential or password")
            }
            else {
                print("Navigate to home screen")
            }
        })
    }
}
