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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        completedView.isHidden = true
        ongoing.layer.cornerRadius = 6
        completed.layer.cornerRadius = 6
    }
    
    @IBAction func ongoingButtonTapped(_ sender: Any) {
        
        ongoingView.isHidden = false
        completedView.isHidden = true
        completed.backgroundColor = .clear
        completed.setTitleColor(UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1.00), for: .normal)
        ongoing.backgroundColor = UIColor(red: 0.02, green: 0.17, blue: 0.36, alpha: 1.00)
        ongoing.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func completedButtonTapped(_ sender: Any) {
        
        ongoingView.isHidden = true
        completedView.isHidden = false
        ongoing.backgroundColor = .clear
        ongoing.setTitleColor(UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1.00), for: .normal)
        completed.backgroundColor = UIColor(red: 0.02, green: 0.17, blue: 0.36, alpha: 1.00)
        completed.setTitleColor(.white, for: .normal)
    }
    
}
