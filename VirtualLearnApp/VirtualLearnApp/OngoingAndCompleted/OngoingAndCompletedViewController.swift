//
//  OngoingAndCompletedViewController.swift
//  VirtualLearnApp
//
//  Created by Anushree on 15/04/22.
//

import UIKit

class OngoingAndCompletedViewController: UIViewController {
    
    @IBOutlet weak var ongoing: UIButton!
    @IBOutlet weak var completed: UIButton!
    @IBOutlet weak var ongoingView: UIView!
    @IBOutlet weak var completedView: UIView!
    
    var ongoingCourses = [MyCoursesDataModel]()
    var completedCourses = [MyCoursesDataModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        showOngoing()
        ongoing.layer.cornerRadius = 6
        completed.layer.cornerRadius = 6
        configureNavigationBar()
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
    
    @objc func searchItemTapped() {
        let searchStoryboard = UIStoryboard.init(name: "SearchStoryboard", bundle: Bundle.main)
        let searchVC = searchStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
        self.navigationController?.pushViewController(searchVC!, animated: true)
    }
    
    @objc func hamburgerButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showOngoing() {
        
        completedView.isHidden = true
        ongoingView.isHidden = false
        let ongoingVc = self.storyboard!.instantiateViewController(withIdentifier: "OngoingViewController") as! OngoingViewController
        ongoingVc.courseList = self.ongoingCourses
        addChild(ongoingVc)
        ongoingVc.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        ongoingVc.view.frame = ongoingView.bounds
        ongoingView.addSubview(ongoingVc.view)
        ongoingVc.didMove(toParent: self)
    }
    
    func showCompleted() {
        
        ongoingView.isHidden = true
        let completedVc = self.storyboard!.instantiateViewController(withIdentifier: "CompletedViewController") as! CompletedViewController
        completedVc.courseList = self.completedCourses
        addChild(completedVc)
        completedVc.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        completedVc.view.frame = completedView.bounds
        completedView.addSubview(completedVc.view)
        completedView.isHidden = false
        completedVc.didMove(toParent: self)
    }
    
    
    @IBAction func ongoingButtonTapped(_ sender: Any) {
        
        showOngoing()
        completed.backgroundColor = .clear
        completed.setTitleColor(UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1.00), for: .normal)
        ongoing.backgroundColor = UIColor(red: 0.02, green: 0.17, blue: 0.36, alpha: 1.00)
        ongoing.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func completedButtonTapped(_ sender: Any) {
        
        showCompleted()
        ongoing.backgroundColor = .clear
        ongoing.setTitleColor(UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1.00), for: .normal)
        completed.backgroundColor = UIColor(red: 0.02, green: 0.17, blue: 0.36, alpha: 1.00)
        completed.setTitleColor(.white, for: .normal)
    }
    
}
