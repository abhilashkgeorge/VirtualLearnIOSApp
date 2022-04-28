//
//  TestModuleViewController.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 19/04/22.
//

import UIKit

class TestModuleViewController: UIViewController {
    
    
    @IBOutlet weak var option1: UIView!
    @IBOutlet weak var option2: UIView!
    @IBOutlet weak var option3: UIView!
    @IBOutlet weak var option4: UIView!
    
    @IBOutlet weak var option1Uncheck: UIImageView!
    @IBOutlet weak var option1Check: UIImageView!
    @IBOutlet weak var option2Uncheck: UIImageView!
    @IBOutlet weak var option2Check: UIImageView!
    @IBOutlet weak var option3Uncheck: UIImageView!
    @IBOutlet weak var option3Check: UIImageView!
    @IBOutlet weak var option4Uncheck: UIImageView!
    @IBOutlet weak var option4Check: UIImageView!
    
    
    @IBOutlet weak var testBottom: UIView!
    
    @IBOutlet weak var testCV: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsUI()
        configureNavigationBar()
        
    }
    
    func optionsUI() {
        
        testCV.isHidden = true
        testBottom.isHidden = false
        
        option1.layer.borderWidth = 0.5
        option2.layer.borderWidth = 0.5
        option3.layer.borderWidth = 0.5
        option4.layer.borderWidth = 0.5

        option1.layer.borderColor = UIColor.clear.cgColor
        option2.layer.borderColor = UIColor.clear.cgColor
        option3.layer.borderColor = UIColor.clear.cgColor
        option4.layer.borderColor = UIColor.clear.cgColor

        option1.layer.shadowColor = UIColor.lightGray.cgColor
        option1.layer.shadowOpacity = 0.3
        option1.layer.shadowRadius = 2
        option1.layer.shadowOffset = .zero
        option2.layer.shadowColor = UIColor.lightGray.cgColor
        option2.layer.shadowOpacity = 0.3
        option2.layer.shadowRadius = 2
        option2.layer.shadowOffset = .zero
        option3.layer.shadowColor = UIColor.lightGray.cgColor
        option3.layer.shadowOpacity = 0.3
        option3.layer.shadowRadius = 2
        option3.layer.shadowOffset = .zero
        option4.layer.shadowColor = UIColor.lightGray.cgColor
        option4.layer.shadowOpacity = 0.3
        option4.layer.shadowRadius = 2
        option4.layer.shadowOffset = .zero

        option1.layer.cornerRadius = 5
        option2.layer.cornerRadius = 5
        option3.layer.cornerRadius = 5
        option4.layer.cornerRadius = 5
        
        option1Check.isHidden = true
        option2Check.isHidden = true
        option3Check.isHidden = true
        option4Check.isHidden = true
        
        option1Uncheck.isHidden = false
        option2Uncheck.isHidden = false
        option3Uncheck.isHidden = false
        option4Uncheck.isHidden = false
        
    }
    
    @IBAction func onClickNext(_ sender: Any) {
        testCV.isHidden = false
        testBottom.isHidden = true
    }
    
    @IBAction func onClickPrevious(_ sender: Any) {
        
    }
   
    @IBAction func onClickOption1(_ sender: Any) {
        option1.backgroundColor = UIColor.customOrange
        option2.backgroundColor = .white
        option3.backgroundColor = .white
        option4.backgroundColor = .white
        
        option1Check.isHidden = false
        option2Check.isHidden = true
        option3Check.isHidden = true
        option4Check.isHidden = true
        
        option1Uncheck.isHidden = true
        option2Uncheck.isHidden = false
        option3Uncheck.isHidden = false
        option4Uncheck.isHidden = false
    }
    
    @IBAction func onClickOption2(_ sender: Any) {
        option1.backgroundColor = .white
        option2.backgroundColor = UIColor.customOrange
        option3.backgroundColor = .white
        option4.backgroundColor = .white
        
        option1Check.isHidden = true
        option2Check.isHidden = false
        option3Check.isHidden = true
        option4Check.isHidden = true
        
        option1Uncheck.isHidden = false
        option2Uncheck.isHidden = true
        option3Uncheck.isHidden = false
        option4Uncheck.isHidden = false
    }
    
    @IBAction func onClickOption3(_ sender: Any) {
        option1.backgroundColor = .white
        option2.backgroundColor = .white
        option3.backgroundColor = UIColor.customOrange
        option4.backgroundColor = .white
        
        option1Check.isHidden = true
        option2Check.isHidden = true
        option3Check.isHidden = false
        option4Check.isHidden = true
        
        option1Uncheck.isHidden = false
        option2Uncheck.isHidden = false
        option3Uncheck.isHidden = true
        option4Uncheck.isHidden = false
    }
    
    @IBAction func onClickOption4(_ sender: Any) {
        option1.backgroundColor = .white
        option2.backgroundColor = .white
        option3.backgroundColor = .white
        option4.backgroundColor = UIColor.customOrange
        
        option1Check.isHidden = true
        option2Check.isHidden = true
        option3Check.isHidden = true
        option4Check.isHidden = false
        
        option1Uncheck.isHidden = false
        option2Uncheck.isHidden = false
        option3Uncheck.isHidden = false
        option4Uncheck.isHidden = true
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: UIImage.AssetImages.CloseIcon.rawValue), style: .plain, target: self, action: #selector(closeBtnTapped))
        ]
        
        
    }
    
    @objc func closeBtnTapped() {
        print("Close Button Tapped")
    }
}

