//
//  LoginViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 07/04/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        let logo = UIBarButtonItem(image: UIImage(named: "img_virtuallearn_lockup") , style: UIBarButtonItem.Style.plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = logo
    }

    @IBAction func loginTapped(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(identifier: "WelcomeBackViewController") as? WelcomeBackViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        let NewAccountstoryboard = UIStoryboard.init(name: "NewAccount", bundle: Bundle.main)
        let registerVC = NewAccountstoryboard.instantiateViewController(identifier: "NewAccountViewController") as? NewAccountViewController
        self.navigationController?.pushViewController(registerVC!, animated: true)

    }
}
