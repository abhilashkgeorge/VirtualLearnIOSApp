//
//  LoginViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 07/04/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var loginButton: WelcomeScreenButton!
    @IBOutlet weak var registerButton: WelcomeScreenButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    @IBAction func loginTapped(_ sender: Any) {
//        let vc = storyboard!.instantiateViewController(identifier: "WelcomeBackViewController") as? WelcomeBackViewController
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        print("register screen")
    }
}
