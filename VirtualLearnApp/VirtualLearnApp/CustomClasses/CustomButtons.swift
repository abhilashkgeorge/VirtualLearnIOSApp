//
//  WelcomeScreenButton.swift
//  VirtualLearnApp
//
//  Created by Anusha on 07/04/22.
//

import UIKit

class WelcomeScreenButton: UIButton {

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupWelcomeScreenButton()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupWelcomeScreenButton()
    }
    
    override var isHighlighted: Bool {
          didSet {
            self.backgroundColor = self.isHighlighted ? UIColor(red: 238/255, green: 92/255, blue: 77/255,alpha: 1) : UIColor(red: 238/255, green: 92/255, blue: 77/255,alpha: 0)
          }
      }
    
    func setupWelcomeScreenButton() -> Void {

        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor(red: 238/255, green: 92/255, blue: 77/255,alpha: 1).cgColor
        self.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255,alpha: 0), for: .highlighted)

    }
}

//MARK: Button setup for buttons which is used for buttons similar to Forgot password
class BasicOrangeButton: UIButton{
    
    override init(frame: CGRect) {
         super.init(frame: frame)
         setup()
       }

    required init?(coder: NSCoder) {
         super.init(coder: coder)
         setup()
       }

    private func setup() {
         self.setTitleColor(UIColor(red: 238/255, green: 92/255, blue: 77/255, alpha: 1), for: .normal)
         self.layer.masksToBounds = true
       }
    
}

//extension UIColor {
//
//    func orange() -> UIColor{
//
//        let orange = UIColor(red: 238/255, green: 92/255, blue: 77/255, alpha: 1)
//        return orange
//
//    }
//}



