//
//  PersonalDetailsViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 11/04/22.
//

import UIKit

class PersonalDetailsViewController: UIViewController {

    var viewmodel = RegisterViewModel()
    var phone = ""
    @IBOutlet weak var mobileNumberDisplay: UILabel!
    
    @IBOutlet weak var personalDetailFullName: FloatingLabel!
    @IBOutlet weak var personalDetailUsername: FloatingLabel!
    @IBOutlet weak var personalDetailEmail: FloatingLabel!
    @IBOutlet weak var personalDetailPassword: FloatingLabel!
    @IBOutlet weak var personalDetailConfirmPassword: FloatingLabel!
    @IBOutlet weak var phoneNumberRegistration: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberRegistration.text = phone
    }
    
    @IBAction func rgisterButtonTapped(_ sender: Any) {
        
        if personalDetailPassword.text?.count ?? 0 < 6 {
            showToast()
        }
        else {
            viewmodel.registerOfUser(fullname: personalDetailFullName.text ?? "AnushaM", username: personalDetailUsername.text ?? "Anusha", email: personalDetailEmail.text ?? "anu@gmail.com", password: personalDetailPassword.text ?? "anusha", confirmpassword: personalDetailConfirmPassword.text ?? "anusha", completion: {
                (successMsg: String) -> Void
                    in
                if successMsg == "Account created" {
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard.init(name: "RegisterPart2", bundle: Bundle.main)
                        let successVc = storyboard.instantiateViewController(withIdentifier: "RegisterSuccessViewController") as? RegisterSuccessViewController
                        self.navigationController?.pushViewController(successVc!, animated: true)
                    }
                }
                else {
                    print("Registration not successful")
                }
            })

        }
    }
}
extension PersonalDetailsViewController {
    
    func showToast() {
        
        let toastView = UIView(frame: CGRect(x: 20, y: 630, width: 327, height: 5))
        toastView.backgroundColor = UIColor.green.withAlphaComponent(0)
        
        let toastLabel = UILabel(frame: CGRect(x: 5, y: 1, width: 300, height: 20))
        toastLabel.textColor = UIColor(red:0.02, green:0.17, blue:0.36, alpha:1)
        toastLabel.font = .systemFont(ofSize: 12.0)
        toastLabel.textAlignment = .left;
        toastLabel.text = "Our minimum Requirment"
        toastLabel.backgroundColor = UIColor.white.withAlphaComponent(1)

        let toastLabel1 = UILabel(frame: CGRect(x: 5, y: 20, width: 300, height: 32))
        toastLabel1.textColor = UIColor.gray
        toastLabel1.font = .systemFont(ofSize: 10.0)
        toastLabel1.textAlignment = .left;
        toastLabel1.text = "At least 6 characters long with one number, one uppercase letter, and one lowercase letter."
        toastLabel1.layer.cornerRadius = 5;
        toastLabel1.clipsToBounds  =  true
        toastLabel1.lineBreakMode = .byWordWrapping
        toastLabel1.numberOfLines = 0
        toastLabel1.backgroundColor = UIColor.white.withAlphaComponent(1)

        toastView.addSubview(toastLabel)
        toastView.addSubview(toastLabel1)
        self.view.addSubview(toastView)
        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveEaseOut, animations: {
            toastView.alpha = 0
        }, completion: {(isCompleted) in
            toastView.removeFromSuperview()
        })
        
    }
}
