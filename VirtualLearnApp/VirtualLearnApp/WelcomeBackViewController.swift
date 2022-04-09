//
//  WelcomeBackViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 08/04/22.
//

import UIKit

class WelcomeBackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func welcomeBackLoginTapped(_ sender: Any) {
        
        let vc = storyboard!.instantiateViewController(identifier: "CreateNewPasswordViewController") as? CreateNewPasswordViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
