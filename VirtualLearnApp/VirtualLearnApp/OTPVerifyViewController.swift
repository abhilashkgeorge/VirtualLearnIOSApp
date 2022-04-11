//
//  OTPVerifyViewController.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 10/04/22.
//

import UIKit

class OTPVerifyViewController: UIViewController{

    @IBOutlet weak var otpTF1: UITextField!
    @IBOutlet weak var otpTF2: UITextField!
    @IBOutlet weak var otpTF3: UITextField!
    @IBOutlet weak var otpTF4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.otpTF1.delegate = self
        self.otpTF2.delegate = self
        self.otpTF3.delegate = self
        self.otpTF4.delegate = self
        
        self.otpTF1.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        
    }
    @objc func changeCharacter(textField: UITextField){
        
        if textField.text?.utf8.count == 1 {
        switch textField {
        case otpTF1:
            otpTF2.becomeFirstResponder()
            
        case otpTF2:
            otpTF3.becomeFirstResponder()
            
        case otpTF3:
            otpTF4.becomeFirstResponder()
            
        case otpTF4:
            otpTF4.resignFirstResponder()
//            print("OTP = \(otpTF1.text)\(otpTF2.text)\(otpTF3.text)\(otpTF4.text)")
            
        default:
            break
        }
        }
    }

}

extension OTPVerifyViewController: UITextFieldDelegate {
    
}
