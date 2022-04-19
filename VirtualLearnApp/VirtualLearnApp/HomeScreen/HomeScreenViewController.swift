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
    
    var viewModel = MyCoursesViewModel()
    
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
        let myCoursesStoryboard = UIStoryboard.init(name: "MyCourses", bundle: Bundle.main)
        let myCoursesVC = myCoursesStoryboard.instantiateViewController(withIdentifier: "OngoingAndCompletedViewController") as? OngoingAndCompletedViewController
        self.navigationController?.pushViewController(myCoursesVC!, animated: true)
    }
    
    @IBAction func myProfileBtn(_ sender: Any) {
        let profileStoryboard = UIStoryboard.init(name: "Profile", bundle: Bundle.main)
        let profileVC = profileStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
        self.navigationController?.pushViewController(profileVC!, animated: true)
    }
    
    @IBAction func notificationBtn(_ sender: Any) {
        let notificationsStoryboard = UIStoryboard.init(name: "Notifications", bundle: Bundle.main)
        let notificationsVC = notificationsStoryboard.instantiateViewController(withIdentifier: "NotificationsViewController") as? NotificationsViewController
        self.navigationController?.pushViewController(notificationsVC!, animated: true)
    }
    
    @IBAction func settingsBtn(_ sender: Any) {
        let settingsStoryboard = UIStoryboard.init(name: "Settings", bundle: Bundle.main)
        let settingsVC = settingsStoryboard.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController
        self.navigationController?.pushViewController(settingsVC!, animated: true)
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
        let searchStoryboard = UIStoryboard.init(name: "SearchStoryboard", bundle: Bundle.main)
        let searchVC = searchStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
        self.navigationController?.pushViewController(searchVC!, animated: true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearch()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    
    }
    
    func hideSearch() {
    }
    
}
