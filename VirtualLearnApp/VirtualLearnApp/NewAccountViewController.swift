//
//  NewAccountViewController.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 08/04/22.
//

import UIKit

class NewAccountViewController: UIViewController {

    var viewModel = LoginRegisterViewModel()
    @IBOutlet weak var newAccountPhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func newAccountContinueTapped(_ sender: Any) {
        viewModel.sendOTPForRegistration(mobileNumber: newAccountPhoneNumber.text ?? "9945685080")
    }
}
