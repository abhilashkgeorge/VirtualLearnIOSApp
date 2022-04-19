//
//  CustomLabels.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 08/04/22.
//

import UIKit

class CustomHeaderLabel: UILabel {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupHeaderLabel()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupHeaderLabel()
    }
    
    func setupHeaderLabel() -> Void {
        self.textColor = UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1)
        self.font = UIFont.bikoBold(size: 26)

        
    }

}

class CustomSubHeaderLabel: UILabel {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupSubHeaderLabel()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupSubHeaderLabel()
    }
    
    func setupSubHeaderLabel() -> Void {
        self.textColor = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 122/255)
        self.font = UIFont.proximaNovaRegular(size: 16)

    }

}

class NotificationMessageLabel: UILabel {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupNotificationMessageLabel()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupNotificationMessageLabel()
    }
    
    func setupNotificationMessageLabel() -> Void {
        self.textColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1)
        self.font = UIFont(name: "proxima_nova_medium", size: 14)


    }

}

class NotificationTimeLabel: UILabel {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupNotificationTimeLabel()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupNotificationTimeLabel()
    }
    
    func setupNotificationTimeLabel() -> Void {
        self.textColor = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1)
        self.font = UIFont(name: "proxima_nova_medium", size: 12)

    }

}

class SearchScreenLabel: UILabel {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupSearchScreenLabel()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupSearchScreenLabel()
    }
    
    func setupSearchScreenLabel() -> Void {
        self.textColor = UIColor(red:0.17, green:0.17, blue:0.17, alpha:1)
        self.font = UIFont(name: "Proxima-Nova-Sbold", size: 18)

    }
}

class SearchScreenDurationLabel: UILabel {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupSearchScreenDurationLabel()
    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupSearchScreenDurationLabel()
    }
    
    func setupSearchScreenDurationLabel() {
        self.textColor = UIColor(red:0.17, green:0.17, blue:0.17, alpha:1)
        self.font = UIFont(name: "proxima_nova_bold", size: 18)

    }
}
