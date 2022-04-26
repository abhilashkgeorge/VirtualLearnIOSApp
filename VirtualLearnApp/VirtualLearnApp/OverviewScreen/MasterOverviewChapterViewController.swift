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
            configureView()
            showOverView()
            super.viewDidLoad()

            
        }
    

    func configureView() {
        overviewContainerView.isHidden = false
        chapterContainerView.isHidden = false
        courseTitle.text = courseName
        courseTitle.text =  courseNameReference
        courseCatergoryLbl.text =  courseCategoryReference
        courseSizeLbl.text =  "\(String(describing: numberOfChapterReference)) Chapters"
        courseImg.image =  courseImageReference
    }
        @IBAction func chaptersButtonTapped(_ sender: Any) {
            configureView()
            showChapters()
            
        }
        @IBAction func overviewButtonTapped(_ sender: Any) {
            configureView()
            showOverView()
            
        }
    
        func showChapters() {
            overviewContainerView.isHidden = true
            let chapterVC = self.storyboard!.instantiateViewController(withIdentifier: chaptersIdentifier) as! ChaptersViewController
            chapterVC.courseID = self.courseId
            chapterVC.courseName = self.courseName
           addChild(chapterVC)
            chapterVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            chapterVC.view.frame = overviewContainerView.bounds
            overviewContainerView.addSubview(chapterVC.view)
            chapterVC.didMove(toParent: self)
            chaptersButton.tintColor = .customGrey
            chaptersUIView.backgroundColor = .customGrey
            overviewButton.tintColor = .customOrange
            overviewUIView.backgroundColor = .customOrange
            chapterContainerView.isHidden = false
            chaptersButton.tintColor = .customOrange
            chaptersUIView.backgroundColor = .customOrange
            overviewButton.tintColor = .customGrey
            overviewUIView.backgroundColor = .customGrey
        }
        
        
        func showOverView() {
            chapterContainerView.isHidden = true
            let overviewVC = self.storyboard!.instantiateViewController(withIdentifier: overviewIdentifier) as! OverviewScreenController
            overviewVC.courseID = self.courseId
            overviewVC.courseName = self.courseName
           addChild(overviewVC)
            overviewVC.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            overviewVC.view.frame = overviewContainerView.bounds
            overviewContainerView.addSubview(overviewVC.view)
            overviewVC.didMove(toParent: self)
            chaptersButton.tintColor = .customGrey
            chaptersUIView.backgroundColor = .customGrey
            overviewButton.tintColor = .customOrange
            overviewUIView.backgroundColor = .customOrange

       
        }
        
    }


