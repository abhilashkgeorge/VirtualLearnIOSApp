//
//  NewAccountViewController.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 08/04/22.
//

import UIKit

class NewAccountViewController: UIViewController {

    var viewModel = RegisterViewModel()
    @IBOutlet weak var newAccountPhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func newAccountContinueTapped(_ sender: Any) {
       
        if newAccountPhoneNumber.text?.count ?? 10 != 10 {
            print("Enter 10 digit phone number")
        }
        else {
             viewModel.sendOTPForRegistration(mobileNumber: newAccountPhoneNumber.text ?? "9743119850")
            if let verifyAccVC = storyboard?.instantiateViewController(identifier: "OTPVerifyViewController") as? OTPVerifyViewController {
                self.navigationController?.pushViewController(verifyAccVC, animated: true)
            }
        }
    }
    

}
