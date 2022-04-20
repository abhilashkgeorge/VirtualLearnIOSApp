//
//  NewAccountViewController.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 08/04/22.
//

import UIKit
class NewAccountViewController: UIViewController {

    var viewModel = RegisterViewModel()
    var displayScreen = 0
    var phone = ""
    
    @IBOutlet weak var newAccountPhoneNumber: UITextField!
    @IBOutlet weak var headerLabel: CustomHeaderLabel!
    @IBOutlet weak var subLabel: CustomSubHeaderLabel!
    @IBOutlet weak var alreadyHaveAccLabel: CustomSubHeaderLabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var continueButton: MainOrangeFilledButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if displayScreen == 0 {
            headerLabel.text = "New Account"
            subLabel.text = "Create a new account to get access to all courses by entering your mobile number."
            alreadyHaveAccLabel.isHidden = false
            loginButton.isHidden = false
            continueButton.setTitle("Continue", for: .normal)
        }
        else {
            headerLabel.text = "Forgot Password"
            subLabel.text = "Please enter your phone number. You will receive a code to create a new password."
            alreadyHaveAccLabel.isHidden = true
            loginButton.isHidden = true
            continueButton.setTitle("Send", for: .normal)
        }
        
    }
    
    @IBAction func newAccountContinueTapped(_ sender: Any) {
        
        phone = newAccountPhoneNumber.text ?? "12"
        if displayScreen == 0 {
            if newAccountPhoneNumber.text?.count ?? 10 != 10 {
                print("Enter 10 digit phone number")
            }
            else {
                viewModel.sendOTPForRegistration(mobileNumber: newAccountPhoneNumber.text ?? "9743119850",completion: {
                    (token: String) -> Void
                    in
                    if token == ""{
                        print("Phone number is registered.Please login")
                    }
                    else {
                        DispatchQueue.main.async {
                            if let verifyAccVC = self.storyboard?.instantiateViewController(identifier: "OTPVerifyViewController") as? OTPVerifyViewController {
                                    verifyAccVC.displayScreen = 0
                                    verifyAccVC.phoneString = self.phone
                                    self.navigationController?.pushViewController(verifyAccVC, animated: true)
                            }
                        }
                    }
                })
            }
        }
        
        else {
            if newAccountPhoneNumber.text?.count ?? 10 != 10 {
                print("Enter 10 digit phone number")
            }
            else {
                viewModel.sendOTPForForgotPassword(mobileNumber: newAccountPhoneNumber.text ?? "9743119850",completion: {
                    (token: String) -> Void
                    in
                    if token == ""{
                        print("Phone is not registered.Please register")
                        
                    }
                    else {
                        DispatchQueue.main.async {
                            if let verifyAccVC = self.storyboard?.instantiateViewController(identifier: "OTPVerifyViewController") as? OTPVerifyViewController {
                                    verifyAccVC.displayScreen = 1
                                    verifyAccVC.phoneString = self.phone
                                    self.navigationController?.pushViewController(verifyAccVC, animated: true)
                            }
                        }
                    }
                })
            }
        }
    }
    
    @IBAction func newAccountLoginTapped(_ sender: Any) {
        
        let loginstoryboard = UIStoryboard.init(name: "Login", bundle: Bundle.main)
        let loginVC = loginstoryboard.instantiateViewController(identifier: "WelcomeBackViewController") as? WelcomeBackViewController
        self.navigationController?.pushViewController(loginVC!, animated: true)
    }
}
