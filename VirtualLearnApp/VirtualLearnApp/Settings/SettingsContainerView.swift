//
//  SettingsContainerView.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 11/04/22.
//

import UIKit

class SettingsContainerView: UIViewController {
    @IBOutlet weak var pushNotifyOFFButton: UIButton!
    @IBOutlet weak var termsOfServiceOFFButton: UIButton!
    @IBOutlet weak var pushNotifyONButton: UIButton!
    @IBOutlet weak var termsOfServiceONButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pushNotifyONButton.isHidden = true
        termsOfServiceONButton.isHidden = true
        configureNavigationBar()
    }
    func configureNavigationBar() {
        
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.backButton.rawValue), style: .plain, target: self, action: #selector(backBtnTapped))
        ]
    }
    
    @objc func backBtnTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func pushNotificationOFFButtonClicked(_ sender: Any) {
        pushNotifyOFFButton.isHidden = true
        pushNotifyONButton.isHidden = false
    }
    
    
    @IBAction func termsOfServiceOFFButtonClicked(_ sender: Any) {
        termsOfServiceOFFButton.isHidden = true
        termsOfServiceONButton.isHidden = false
    }
    
    @IBAction func pushNotificationONButtonClicked(_ sender: Any) {
        pushNotifyOFFButton.isHidden = false
        pushNotifyONButton.isHidden = true
    }
    
    @IBAction func termsPfServiceONButtonClicked(_ sender: Any) {
        termsOfServiceOFFButton.isHidden = false
        termsOfServiceONButton.isHidden = true
    }
    
}
