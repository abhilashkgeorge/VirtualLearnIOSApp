//
//  CustomView.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 08/04/22.
//

import UIKit

class UnopenedNotificationIndicator: UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupUnopenedNotification()

    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupUnopenedNotification()
    }
    
    
    func setupUnopenedNotification() -> Void {

        self.frame = CGRect(x: 0, y: 0, width: 6, height: 6)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = 3.5
        self.backgroundColor = UIColor(red: 238/255, green: 92/255, blue: 77/255, alpha: 1)
        

    }
}
