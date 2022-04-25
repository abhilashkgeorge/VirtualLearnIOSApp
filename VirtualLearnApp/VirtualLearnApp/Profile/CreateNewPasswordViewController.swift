//
//  CreateNewPasswordViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 08/04/22.
//

import UIKit

class CreateNewPasswordViewController: UIViewController {

    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    let viewmodel = RegisterViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func resetPasswordTapped(_ sender: Any) {
        
        let newPassword = newPasswordTextField.text ?? ""
        
        if newPassword.count < 6 {
            showToast()
        }
        else {
            viewmodel.resetPassword(password: newPasswordTextField.text ?? "Anusha18", confirmPassword: confirmNewPasswordTextField.text ?? "Anusha18",completion: {
                (tokenMsg: String) -> Void
                in
                if tokenMsg == "Password changed successfully" {
                    DispatchQueue.main.async {
                        let NewAccountstoryboard = UIStoryboard.init(name: "RegisterPart2", bundle: Bundle.main)
                        let successVC = NewAccountstoryboard.instantiateViewController(identifier: "RegisterSuccessViewController") as? RegisterSuccessViewController
                        successVC?.displayScreen = 1
                        self.navigationController?.pushViewController(successVC!, animated: true)
                    }
                }
                else if tokenMsg == "password should be atleast 6 characters long with 'one number','one uppercase letter' and 'one lowercase letter'" {
                    DispatchQueue.main.async {
                        self.showToast()
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.showToast(message: "Invalid credential or password")
                    }
                    print("Invalid credential or password")
                }
            })
        }
    }
}
extension CreateNewPasswordViewController {
    
    func showToast() {
        
        let toastView = UIView(frame: CGRect(x: 20, y: 255, width: 327, height: 5))
        toastView.backgroundColor = UIColor.green.withAlphaComponent(0)
        
        let toastLabel = UILabel(frame: CGRect(x: 5, y: 1, width: 300, height: 20))
        toastLabel.textColor = UIColor(red:0.02, green:0.17, blue:0.36, alpha:1)
        toastLabel.font = .systemFont(ofSize: 12.0)
        toastLabel.textAlignment = .left;
        toastLabel.text = "Our minimum Requirment"
        toastLabel.backgroundColor = UIColor.white.withAlphaComponent(1)

        let toastLabel1 = UILabel(frame: CGRect(x: 5, y: 20, width: 300, height: 32))
        toastLabel1.textColor = UIColor.gray
        toastLabel1.font = .systemFont(ofSize: 10.0)
        toastLabel1.textAlignment = .left;
        toastLabel1.text = "At least 6 characters long with one number, one uppercase letter, and one lowercase letter."
        toastLabel1.layer.cornerRadius = 5;
        toastLabel1.clipsToBounds  =  true
        toastLabel1.lineBreakMode = .byWordWrapping
        toastLabel1.numberOfLines = 0
        toastLabel1.backgroundColor = UIColor.white.withAlphaComponent(1)

        toastView.addSubview(toastLabel)
        toastView.addSubview(toastLabel1)
        self.view.addSubview(toastView)
        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveEaseOut, animations: {
            toastView.alpha = 0
        }, completion: {(isCompleted) in
            toastView.removeFromSuperview()
        })
        
    }
}
