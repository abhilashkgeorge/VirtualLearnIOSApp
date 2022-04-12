//
//  CustomImageView.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 11/04/22.
//

import UIKit

class NotificationImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNotificationImageView()

    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNotificationImageView()
    }
        
        
    func setupNotificationImageView() -> Void {

        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor

        }
   


}
