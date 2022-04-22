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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsUI()
        
    }
    
    func optionsUI() {
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
        
        
    }
    

}
