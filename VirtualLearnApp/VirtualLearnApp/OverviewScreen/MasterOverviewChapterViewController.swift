//
//  MasterOverviewChapterViewController.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 20/04/22.
//

import UIKit

class MasterOverviewChapterViewController: UIViewController {
    
    let  overviewIdentifier = "OverviewScreenController"
    let  chaptersIdentifier = "ChaptersViewController"
    

    @IBOutlet weak var courseImg: UIImageView!
    @IBOutlet weak var chaptersButton: UIButton!
    @IBOutlet weak var overviewButton: UIButton!
    @IBOutlet weak var chaptersUIView: UIView!
    @IBOutlet weak var overviewUIView: UIView!
    @IBOutlet weak var mainContainerView: UIView!
    
        
        var chaptersVC = UIViewController()
        var overviewVC = UIViewController()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            showSignIn()
            setBackgroundGradientColour()
        }
        
        func setBackgroundGradientColour(){
//            let gradient = CAGradientLayer()
//            gradient.frame = self.view.bounds
//            //gradient.colors = [UIColor(named: "#20BBFF")!.cgColor, UIColor(named: "#0E85FF")!.cgColor]
//            self.view.layer.insertSublayer(gradient, at: 0)
        }
        
        @IBAction func chaptersButtonTapped(_ sender: Any) {
            showSignIn()
        }
        @IBAction func overviewButtonTapped(_ sender: Any) {
            showSignUp()
        }
        
        var status = false
    
    
        func showSignIn() {
//            reactGoldView.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([reactGoldView.centerXAnchor.constraint(equalTo: headerSignInBtn.centerXAnchor)
//            ])

            if status == false {
               chaptersVC = storyboard?.instantiateViewController(withIdentifier: chaptersIdentifier) as! ChaptersViewController
                overviewVC = storyboard?.instantiateViewController(withIdentifier: overviewIdentifier) as! OverviewScreenController
                status = true
            }
            
            remove(asChildViewController: overviewVC)
            add(asChildViewController: chaptersVC)

        }
        
        
        func showSignUp() {
    //        reactGoldView.translatesAutoresizingMaskIntoConstraints = false
    //        NSLayoutConstraint.activate([reactGoldView.centerXAnchor.constraint(equalTo: headerSignInBtn.centerXAnchor)        ])
            remove(asChildViewController: chaptersVC)
            add(asChildViewController: overviewVC)
            print("hello")
       
        }
        
        func signUpSuccess() {
           
            remove(asChildViewController: chaptersVC)
            //add(asChildViewController: signInVc)
        }
        public func add(asChildViewController viewController: UIViewController) {
           
            addChild(viewController)
            mainContainerView.addSubview(viewController.view)
            viewController.view.frame = mainContainerView.bounds
            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            viewController.didMove(toParent: self)
        }

        public func remove(asChildViewController viewController: UIViewController) {
            viewController.willMove(toParent: nil)
            viewController.view.removeFromSuperview()
            viewController.removeFromParent()
        }
    }

    



