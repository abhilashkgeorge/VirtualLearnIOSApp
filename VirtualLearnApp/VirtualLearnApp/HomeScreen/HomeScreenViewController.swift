//
//  HomeScreenViewController.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 12/04/22.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuView: UIView!
    
    @IBOutlet weak var hamburgerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()

        // Do any additional setup after loading the view.
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.SearchIcon.rawValue), style: .done, target: self, action: #selector(searchItemTapped))
        ]
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.HamburgerMenu.rawValue), style: .done, target: self, action: #selector(hamburgerButtonPressed))
        ]
    }
    
    
    //MARK: OUTLETS
    
    @IBAction func homeBtnTapped(_ sender: Any) {
        sideMenuConstraint.constant = 0
        animateView()
        configureNavigationBar()
    }
    
    @IBAction func myCourseBtn(_ sender: Any) {
    }
    
    @IBAction func myProfileBtn(_ sender: Any) {
    }
    
    @IBAction func notificationBtn(_ sender: Any) {
    }
    
    @IBAction func settingsBtn(_ sender: Any) {
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
    }
    
    
    @objc func hamburgerButtonPressed(_ sender: Any) {
        print("tapped")
        hamburgerView.translatesAutoresizingMaskIntoConstraints = false
        sideMenuConstraint.constant = -350
        animateView()
    }
    
    func animateView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded() })
        
        navigationItem.leftBarButtonItems = []
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != sideMenuView {
            configureNavigationBar()
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}

extension HomeScreenViewController: UISearchBarDelegate {
    
    @objc func searchItemTapped() {
      
        }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearch()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    
    }
    
    func hideSearch() {
    }
    
}
