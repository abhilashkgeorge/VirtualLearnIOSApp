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
                    print("Change password is successfull")
                } else {
                    print("Change password attempt failed!!!")
                }
            })
        }
    }
}
