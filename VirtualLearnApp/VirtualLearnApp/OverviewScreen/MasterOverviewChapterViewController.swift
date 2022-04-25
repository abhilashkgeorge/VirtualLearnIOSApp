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
    
    var courseName: String = ""
    var courseId: String = ""
    
    
//MARK: Header
    @IBOutlet weak var courseImg: UIImageView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseCatergoryLbl: UILabel!
    @IBOutlet weak var courseSizeLbl: UILabel!
    
    var courseNameReference: String?
    var courseCategoryReference: String?
    var numberOfChapterReference: Int?
    var courseImageReference: UIImage?
    
    //MARK: Buttons and UIVIew
    @IBOutlet weak var chaptersButton: UIButton!
    @IBOutlet weak var overviewButton: UIButton!
    @IBOutlet weak var chaptersUIView: UIView!
    @IBOutlet weak var overviewUIView: UIView!
    
    @IBOutlet weak var overviewContainerView: UIView!
    @IBOutlet weak var chapterContainerView: UIView!
    
        override func viewDidLoad() {
            showOverView()
            super.viewDidLoad()

            configureView()
        }
    

    func configureView() {
        courseTitle.text = courseName
        courseTitle.text =  courseNameReference
        courseCatergoryLbl.text =  courseCategoryReference
        courseSizeLbl.text =  "\(String(describing: numberOfChapterReference)) Chapters"
        courseImg.image =  courseImageReference
    }
        @IBAction func chaptersButtonTapped(_ sender: Any) {
            showChapters()
        }
        @IBAction func overviewButtonTapped(_ sender: Any) {
            showOverView()
        }
        
    var status = false
    
//    var chaptersVC = UIViewController()
//
//    var overviewVC = UIViewController()
    
    
        func showChapters() {
            chapterContainerView.isHidden = false
            overviewContainerView.isHidden = true
            chaptersButton.tintColor = .customOrange
            chaptersUIView.backgroundColor = .customOrange
            overviewButton.tintColor = .customGrey
            overviewUIView.backgroundColor = .customGrey
            
//            remove(asChildViewController: overviewVC)
//            add(asChildViewController: chaptersVC)

        }
        
        
        func showOverView() {
            chapterContainerView.isHidden = true
            overviewContainerView.isHidden = false
            //            if status == false {
//                chaptersVC = storyboard?.instantiateViewController(withIdentifier: chaptersIdentifier) as! ChaptersViewController
//
//
//             overviewVC = storyboard?.instantiateViewController(withIdentifier: overviewIdentifier) as! OverviewScreenController
//
//               let over = overviewVC as! OverviewScreenController
//                DispatchQueue.main.async {
//                    over.getOverviewDetails(name: self.courseName, id: self.courseId)
//
//                }
//
//                status = true
//            }

//            remove(asChildViewController: chaptersVC)
//            add(asChildViewController: overviewVC)
            chaptersButton.tintColor = .customGrey
            chaptersUIView.backgroundColor = .customGrey
            overviewButton.tintColor = .customOrange
            overviewUIView.backgroundColor = .customOrange
       
        }
        

//        public func add(asChildViewController viewController: UIViewController) {
//
//            addChild(viewController)
//            mainContainerView.addSubview(viewController.view)
//            viewController.view.frame = mainContainerView.bounds
//            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//            viewController.didMove(toParent: self)
//        }
//
//        public func remove(asChildViewController viewController: UIViewController) {
//            viewController.willMove(toParent: nil)
//            viewController.view.removeFromSuperview()
//            viewController.removeFromParent()
//        }
    }


