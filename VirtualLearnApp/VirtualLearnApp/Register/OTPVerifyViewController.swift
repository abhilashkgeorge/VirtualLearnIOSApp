//
//  OTPVerifyViewController.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 10/04/22.
//

import UIKit

class OTPVerifyViewController: UIViewController,UITextFieldDelegate {

    var viewmodel = RegisterViewModel()
    var OTP: String = ""
    var phoneString: String = ""
    var displayScreen = 0
    
    @IBOutlet weak var otpTF1: UITextField!
    @IBOutlet weak var otpTF2: UITextField!
    @IBOutlet weak var otpTF3: UITextField!
    @IBOutlet weak var otpTF4: UITextField!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var verifyButton: MainOrangeFilledButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.otpTF1.delegate = self
        self.otpTF2.delegate = self
        self.otpTF3.delegate = self
        self.otpTF4.delegate = self
        
        if displayScreen == 0 {
            headerLabel.text = "Verify Account"
            verifyButton.setTitle("Verify", for: .normal)
        }
        else {
            headerLabel.text = "Verification"
            verifyButton.setTitle("Submit", for: .normal)
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.count ?? 0 < 1 ) && (string.count > 0) {
            if textField == otpTF1 {
                otpTF2.becomeFirstResponder()
            }
            if textField == otpTF2 {
                otpTF3.becomeFirstResponder()
            }
            if textField == otpTF3 {
                otpTF4.becomeFirstResponder()
            }
            if textField == otpTF4 {
                otpTF4.resignFirstResponder()
            }
            textField.text = string
            return false
        }else if (textField.text?.count ?? 1 >= 1) && (string.count == 0) {
            if textField == otpTF2 {
                otpTF1.becomeFirstResponder()
            }
            if textField == otpTF3 {
                otpTF2.becomeFirstResponder()
            }
            if textField == otpTF4 {
                otpTF3.becomeFirstResponder()
            }
            if textField == otpTF1 {
                otpTF1.resignFirstResponder()
            }
            textField.text = ""
            return false
        } else if textField.text?.count ?? 1 >= 1 {
            textField.text = string
            return false
        }
        return true
    }
    
    @IBAction func resendButtonTapped(_ sender: Any) {
      
        print("phNumber\(phoneString)")
        if displayScreen == 0 {
            viewmodel.sendOTPForRegistration(mobileNumber: phoneString, completion: {
                (token: String) -> Void in print(token) })
        }
        else {
            viewmodel.sendOTPForForgotPassword(mobileNumber: phoneString, completion: {
                (token: String) -> Void in print(token) })
        }
    }
 
    @IBAction func newAccVerifyTapped(_ sender: Any) {
       
        OTP += otpTF1.text ?? "0"
        OTP += otpTF2.text ?? "0"
        OTP += otpTF3.text ?? "0"
        OTP += otpTF4.text ?? "0"
       
       print(OTP)
        if displayScreen == 0 {
            viewmodel.verifyOTPForRegistration(otp: OTP ,completion: {
                (tokenMsg: String) -> Void
                in
                if tokenMsg == ""{
                    print("Invalid credential or password")
                }
                else {
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard.init(name: "RegisterPart2", bundle: Bundle.main)
                        let personalDetailVc = storyboard.instantiateViewController(withIdentifier: "PersonalDetailsViewController") as? PersonalDetailsViewController
                        personalDetailVc?.phone = self.phoneString
                        self.navigationController?.pushViewController(personalDetailVc!, animated: true)
                    }
                }
            })
        }
        else {
            viewmodel.verifyOTPForForgotPassword(otp: OTP ,completion: {
                (tokenMsg: String) -> Void
                in
                if tokenMsg == "OTP verified"{
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard.init(name: "Login", bundle: Bundle.main)
                        let personalDetailVc = storyboard.instantiateViewController(withIdentifier: "CreateNewPasswordViewController") as? CreateNewPasswordViewController
                        self.navigationController?.pushViewController(personalDetailVc!, animated: true)
                    }
                }
                else {
                    print("Invalid credential or password")
                }
            })
        }
       
    }
    
}

