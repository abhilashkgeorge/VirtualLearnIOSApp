//
//  ChangePasswordViewController.swift
//  VirtualLearnApp
//
//  Created by Anushree on 20/04/22.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet weak var currentPassword: FloatingLabel!
    @IBOutlet weak var newPassword: FloatingLabel!
    @IBOutlet weak var confirmNewPassword: FloatingLabel!
    
    var viewModel = ChangePasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkPasswordValidity() -> Bool {
        
        if newPassword.text == confirmNewPassword.text {
            return true
        }else {
            return false
        }
    }
    
    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
        
        if checkPasswordValidity() {
            
            viewModel.changeUserPassword(currentPassword: currentPassword.text ?? "", newPassword: newPassword.text ?? "", confirmPassword: confirmNewPassword.text ?? "", completionHandler: {
                
                (successMessage: String) -> Void
                in
                
                if successMessage == "Password changed successfully" {
                    DispatchQueue.main.async {
                        self.setUpBottomColour(textField: self.currentPassword, color: UIColor.green.cgColor,image:   UIImage(named: "icn_textfield_right") ?? #imageLiteral(resourceName: "icn_textfield_right"))
                            let NewAccountstoryboard = UIStoryboard.init(name: "RegisterPart2", bundle: Bundle.main)
                            let successVC = NewAccountstoryboard.instantiateViewController(identifier: "RegisterSuccessViewController") as? RegisterSuccessViewController
                            successVC?.displayScreen = 1
                            self.navigationController?.pushViewController(successVC!, animated: true)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.setUpBottomColour(textField: self.currentPassword, color: UIColor.red.cgColor,image:   UIImage(named: "icn_textfield_wrong") ?? #imageLiteral(resourceName: "icn_textfield_wrong"))
                        self.showToast(message: "Invalid password, please try again")
                    }

                }
            })
        }
    }
}
