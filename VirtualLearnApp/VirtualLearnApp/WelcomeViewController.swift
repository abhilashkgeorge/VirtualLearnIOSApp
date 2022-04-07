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
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.setHidesBackButton(true, animated: true)
       
        let virtuallearnLogo = UIImage(named: "img_virtuallearn_lockup")
        let virtuallearnLogoLogoImageView = UIImageView(image:virtuallearnLogo)
        self.navigationItem.titleView = virtuallearnLogoLogoImageView
    }

    @IBAction func loginTapped(_ sender: Any) {

    }
    
    @IBAction func registerTapped(_ sender: Any) {
        
    }
}
