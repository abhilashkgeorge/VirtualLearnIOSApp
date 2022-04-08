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
        self.textColor = UIColor.black
        self.font = UIFont(name: "Helvetica Neue" , size: 26)

        
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
        self.font = UIFont(name: "Helvetica Neue" , size: 16)

    }

}
