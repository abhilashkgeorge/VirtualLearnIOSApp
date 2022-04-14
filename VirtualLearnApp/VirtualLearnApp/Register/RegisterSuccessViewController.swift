//
//  RegisterSuccessViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 12/04/22.
//

import UIKit

class RegisterSuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func letsGetStartedTapped(_ sender: Any) {
        let NewAccountstoryboard = UIStoryboard.init(name: "Login", bundle: Bundle.main)
        let registerVC = NewAccountstoryboard.instantiateViewController(identifier: "WelcomeBackViewController") as? WelcomeBackViewController
        self.navigationController?.pushViewController(registerVC!, animated: true)
    }
    
}
