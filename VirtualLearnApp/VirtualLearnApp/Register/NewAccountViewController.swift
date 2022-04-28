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
            self.navigationItem.setHidesBackButton(true, animated: false)
        }
        else {
            headerLabel.text = "Forgot Password"
            subLabel.text = "Please enter your phone number. You will receive a code to create a new password."
            alreadyHaveAccLabel.isHidden = true
            loginButton.isHidden = true
            continueButton.setTitle("Send", for: .normal)
            configureNavigationBar()
        }
        
    }
    func configureNavigationBar() {
        
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.backButton.rawValue), style: .plain, target: self, action: #selector(backBtnTapped))
        ]
    }
    
    @objc func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func newAccountContinueTapped(_ sender: Any) {
        
        phone = newAccountPhoneNumber.text ?? "12"
        if displayScreen == 0 {
            if newAccountPhoneNumber.text?.count ?? 10 != 10 {
                showToast(message: "Enter 10 digit phone number")
            }
            else {
                viewModel.sendOTPForRegistration(mobileNumber: newAccountPhoneNumber.text ?? "9743119850",completion: {
                    (token: String) -> Void
                    in
                    if token == ""{
                        DispatchQueue.main.async {
                            self.setUpBottomColour(textField: self.newAccountPhoneNumber, color: UIColor.red.cgColor, image: UIImage(named: "icn_textfield_wrong") ?? #imageLiteral(resourceName: "icn_textfield_wrong"))
                            self.showToast(message: "Phone number is registered.Please login")
                        }
                    }
                    else {
                        DispatchQueue.main.async {
                            self.setUpBottomColour(textField: self.newAccountPhoneNumber, color: UIColor.green.cgColor,image: UIImage(named: "icn_textfield_right") ?? #imageLiteral(resourceName: "icn_textfield_right"))
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
                showToast(message: "Enter 10 digit phone number")
            }
            else {
                viewModel.sendOTPForForgotPassword(mobileNumber: newAccountPhoneNumber.text ?? "9743119850",completion: {
                    (token: String) -> Void
                    in
                    if token == ""{
                        DispatchQueue.main.async {
                            self.setUpBottomColour(textField: self.newAccountPhoneNumber, color: UIColor.red.cgColor,image:   UIImage(named: "icn_textfield_wrong") ?? #imageLiteral(resourceName: "icn_textfield_wrong"))
                            self.showToast(message: "Invalid mobile number, please try again")
                        }
                        
                    }
                    else {
                        DispatchQueue.main.async {
                            self.setUpBottomColour(textField: self.newAccountPhoneNumber, color: UIColor.green.cgColor,image: UIImage(named: "icn_textfield_right") ?? #imageLiteral(resourceName: "icn_textfield_right"))
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
