//
//  UIViewController+Extention.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 23/04/22.
//

import Foundation
import UIKit

extension UIViewController {

    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width - self.view.frame.size.width, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 54))
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named:"icn_warning")
        imageAttachment.bounds = CGRect(x: -5, y: -5.0, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "")
        completeText.append(attachmentString)
        let textAfterIcon = NSAttributedString(string: message)
        completeText.append(textAfterIcon)
        
        toastLabel.backgroundColor = UIColor.red
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.proximaNovaRegular(size: 16)
        toastLabel.textAlignment = .center;
        toastLabel.attributedText = completeText
        toastLabel.alpha = 1.0
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func setUpBottomColourOTP(textField: UITextField,color: CGColor) {
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 75 - 42, width: 35, height: 2.0)
        bottomLine.backgroundColor = color
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        
    }
    
    func setUpBottomColour(textField: UITextField,color: CGColor,image: UIImage) {
        
       
        let bottomLine = CALayer()
        let logo = UIImageView()
        logo.image = image
        logo.frame = CGRect(x: 300, y: 0.0, width: 20, height: 20)
        
        bottomLine.frame = CGRect(x: 0.0, y: 75 - 50, width: 327, height: 2.0)
        bottomLine.backgroundColor = color
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        textField.addSubview(logo)
    }
}
