//
//  RegisterSuccessViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 12/04/22.
//

import UIKit

class RegisterSuccessViewController: UIViewController {

    var displayScreen = 0
    
    @IBOutlet weak var successImage: UIImageView!
    @IBOutlet weak var mainHeader: UILabel!
    @IBOutlet weak var subHeader: UILabel!
    @IBOutlet weak var letsGetStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if displayScreen == 0 {
            mainHeader.text = "Success!"
            subHeader.text = "Your VirtualLearn account has been successfully created!"
            letsGetStartedButton.setTitle("Lets Get Started", for: .normal)
            successImage.image = #imageLiteral(resourceName: "img_Register_sucess_illustration")
        }
        else {
            mainHeader.text = "Password Changed!"
            subHeader.text = "Your password has been successfully changed. You can now Login with your new password"
            letsGetStartedButton.setTitle("Login", for: .normal)
            successImage.image = #imageLiteral(resourceName: "img_PasswordChange_sucess_illustration")
        }

    }
    @IBAction func letsGetStartedTapped(_ sender: Any) {
        let NewAccountstoryboard = UIStoryboard.init(name: "Login", bundle: Bundle.main)
        let registerVC = NewAccountstoryboard.instantiateViewController(identifier: "WelcomeBackViewController") as? WelcomeBackViewController
        self.navigationController?.pushViewController(registerVC!, animated: true)
    }
    
}
