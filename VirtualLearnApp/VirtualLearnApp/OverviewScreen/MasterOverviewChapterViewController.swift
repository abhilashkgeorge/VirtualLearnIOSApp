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
    
    /*class MainViewController: UIViewController {
     
     func showChildViewController() {
         guard let vc = storyboard?.instantiateViewControllerWithIdentifier("ChildViewController") as? ChildViewController else {
             return
         }
         vc.didSelectItem = { [weak self](item) in
             if let vc = self {
                 // Do something with the item.
             }
         }
         presentViewController(vc, animated: true, completion: nil)
     }

 }

 class ChildViewController: UIViewController {

     var didSelectItem: ((item: Item) -> Void)?

     @IBAction func buttonPressed() {
         didSelectItem?(item: )
     }
*/
//MARK: Header
    @IBOutlet weak var courseImg: UIImageView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseCatergoryLbl: UILabel!
    @IBOutlet weak var courseSizeLbl: UILabel!
    
    
    //MARK: Buttons and UIVIew
    @IBOutlet weak var chaptersButton: UIButton!
    @IBOutlet weak var overviewButton: UIButton!
    @IBOutlet weak var chaptersUIView: UIView!
    @IBOutlet weak var overviewUIView: UIView!
    
    @IBOutlet weak var mainContainerView: UIView!

        override func viewDidLoad() {
            super.viewDidLoad()
            showOverView()
        }

        @IBAction func chaptersButtonTapped(_ sender: Any) {
            showChapters()
        }
        @IBAction func overviewButtonTapped(_ sender: Any) {
            

            showOverView()
        }
        
    var status = false
    
    var chaptersVC: ChaptersViewController {
        storyboard?.instantiateViewController(withIdentifier: chaptersIdentifier) as! ChaptersViewController
    }
    var overviewVC: OverviewScreenController {
        storyboard?.instantiateViewController(withIdentifier: overviewIdentifier) as! OverviewScreenController
    }
    
    
        func showChapters() {

            chaptersButton.tintColor = .customOrange
            chaptersUIView.backgroundColor = .customOrange
            overviewButton.tintColor = .customGrey
            overviewUIView.backgroundColor = .customGrey
            
            remove(asChildViewController: overviewVC)
            add(asChildViewController: chaptersVC)

        }
        
        
        func showOverView() {
    
            remove(asChildViewController: chaptersVC)
            add(asChildViewController: overviewVC)
            chaptersButton.tintColor = .customGrey
            chaptersUIView.backgroundColor = .customGrey
            overviewButton.tintColor = .customOrange
            overviewUIView.backgroundColor = .customOrange
       
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


