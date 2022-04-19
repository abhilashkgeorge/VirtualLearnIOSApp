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
    @IBOutlet weak var homeScreenTableview: UITableView!
    
    @IBOutlet weak var hamburgerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreenTableview.separatorStyle = .none
        configureNavigationBar()
        homeScreenTableview.delegate = self
        homeScreenTableview.dataSource = self
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

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstTableCell") as! HomeScreenTableViewCell
            cell.configureCells(indexPath: indexPath.row)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondTableCell") as! HomeScreenTableViewCell
            cell.contentView.backgroundColor = .white
            cell.configureCells(indexPath: indexPath.row)
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdTableCell") as! HomeScreenTableViewCell
            cell.configureCells(indexPath: indexPath.row)
            return cell
        } else if indexPath.row >= 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "fourthTableCell") as! HomeScreenTableViewCell
            cell.contentView.backgroundColor = .white
            cell.configureCells(indexPath: indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 260
        } else if indexPath.row == 1 {
            return 104
        }
        
        else if indexPath.row == 2 {
            return 220
        } else {
            return 230
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
