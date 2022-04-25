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
                DispatchQueue.main.async {
                    self.setUpBottomColour(textField: self.loginUsername, color:  UIColor.red.cgColor,image:   UIImage(named: "icn_textfield_wrong") ?? #imageLiteral(resourceName: "icn_textfield_wrong"))
                    self.showToast(message: "Invalid username, please try again")
                }
                print("Invalid credential or password")
            }
            else {
                DispatchQueue.main.async {
                    self.setUpBottomColour(textField: self.loginUsername, color:  UIColor.green.cgColor,image:   UIImage(named: "icn_textfield_right") ?? #imageLiteral(resourceName: "icn_textfield_right"))
                    let homeScreenStoryboard = UIStoryboard.init(name: "HomeScreen", bundle: Bundle.main)
                    let homeScreenVC = homeScreenStoryboard.instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController
                    self.navigationController?.pushViewController(homeScreenVC!, animated: true)
                }
            }
        })
    }
    
    @IBAction func loginRegisterTapped(_ sender: Any){
        let NewAccountstoryboard = UIStoryboard.init(name: "NewAccount", bundle: Bundle.main)
        let registerVC = NewAccountstoryboard.instantiateViewController(identifier: "NewAccountViewController") as? NewAccountViewController
        self.navigationController?.pushViewController(registerVC!, animated: true)
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        let NewAccountstoryboard = UIStoryboard.init(name: "NewAccount", bundle: Bundle.main)
        let registerVC = NewAccountstoryboard.instantiateViewController(identifier: "NewAccountViewController") as? NewAccountViewController
        registerVC?.displayScreen = 1
        self.navigationController?.pushViewController(registerVC!, animated: true)
    }
    
}
