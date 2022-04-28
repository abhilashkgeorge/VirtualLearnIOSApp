//
//  SettingViewController.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 07/04/22.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var privacySettingsView: UIView!
    @IBOutlet weak var termsOfServiceView: UIView!
    @IBOutlet weak var extendedSettingsContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extendedSettingsContainerView.isHidden = true
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

    @IBAction func openNavigationSettings(_ sender: Any) {
        privacySettingsView.isHidden = true
        termsOfServiceView.isHidden = true
        extendedSettingsContainerView.isHidden = false
        
    }
    @IBAction func openNavigationSettingsSymbolClicked(_ sender: Any) {
        privacySettingsView.isHidden = true
        termsOfServiceView.isHidden = true
        extendedSettingsContainerView.isHidden = false
        
    }
    
}
