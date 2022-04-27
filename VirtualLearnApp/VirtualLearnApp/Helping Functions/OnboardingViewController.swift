//
//  ViewController.swift
//  VirtualLearnApp
//
//  Created by Anusha on 07/04/22.
//

import UIKit

class OnboardingViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    var pageNumber = 0
    
    var images = ["img_onboarding_illustration1", "img_onboarding_illustration2", "img_onboarding_illustration3"]
    var titles = ["Learner Engagement", "Accountable Tracking", "Seamless Workflow"]
    var desc = ["Interactive features mirror the traditional classroom experience and learners receive feedback to increase long-term retention, tripling learning efficiency over standard video.","Receive immediate, accesible data (both performance and behaviour-based) to effectively remediate concepts, automatically assign grades, and address deficiences.","Sync rosters, create and assign impactful video experiences, enrich your flipped classroom, and streamline tedious grading."]

    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        self.view.layoutIfNeeded()
        scrollViewSetup()
        createSubviews()
        nextButton.layer.cornerRadius = nextButton.frame.width / 2
        nextButton.layer.masksToBounds = true
        self.scrollView.delegate = self
    }

    func setNavBar() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.setHidesBackButton(true, animated: true)
        let logo = UIBarButtonItem(image: UIImage(named: "img_virtuallearn_lockup") , style: UIBarButtonItem.Style.plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = logo
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndicatorForCurrentPage()
    }
    
    func setIndicatorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageNumber = Int(page)
        pageControl?.currentPage = Int(page)
        
        if page == 2 {
            skipButton.isHidden = true
            nextButton.setImage(UIImage(named: "btn_done"), for: .normal)
        } else {
            skipButton.isHidden = false
            nextButton.setImage(UIImage(named: "btn_next"), for: .normal)
        }
    }
    
    func scrollViewSetup() {
        
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
        self.scrollView.contentSize.height = 1.0
    }
    
    func createSubviews() {
        
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            let slide = UIView(frame: frame)
            
            let imageView = UIImageView.init(image: UIImage.init(named: images[index]))
            imageView.frame = CGRect(x:0,y:0,width:300,height:280)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 100)
            
    
            let txt1 = UILabel.init(frame: CGRect(x:32,y:imageView.frame.maxY+30,width:scrollWidth-200,height:100))
            txt1.textAlignment = .left
            txt1.lineBreakMode = .byWordWrapping
            txt1.numberOfLines = 2
            txt1.font = UIFont.bikoBold(size: 24)
            let textString1 = NSAttributedString(string: titles[index]).withLineSpacing(10)
            txt1.attributedText = textString1
            
            
            
            let txt2 = UILabel.init(frame: CGRect(x:32,y:txt1.frame.maxY+10,width:scrollWidth-80,height:90))
            let textString2 = NSAttributedString(string: desc[index]).withLineSpacing(5)
            txt2.attributedText = textString2
            txt2.numberOfLines = 4
            txt2.textAlignment = .left
            txt2.font = UIFont.proximaNovaRegular(size: 14)
            txt2.textColor = UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1.00)
            slide.addSubview(imageView)
            slide.addSubview(txt1)
            slide.addSubview(txt2)
            scrollView.addSubview(slide)
        }
    }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        let loginStoryboard = UIStoryboard.init(name: "Login", bundle: Bundle.main)
        let welcomeVc = loginStoryboard.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController
        self.navigationController?.pushViewController(welcomeVc!, animated: true)
    }
    
    @IBAction func pageControlTapped(_ sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        if pageNumber == 2 {
            let loginStoryboard = UIStoryboard.init(name: "Login", bundle: Bundle.main)
            let welcomeVc = loginStoryboard.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController
            self.navigationController?.pushViewController(welcomeVc!, animated: true)
        } else {
            pageControl.currentPage = pageNumber + 1
            scrollView.contentOffset.x = scrollView.frame.size.width * CGFloat(pageNumber + 1)
            setIndicatorForCurrentPage()
        }
    }
}

