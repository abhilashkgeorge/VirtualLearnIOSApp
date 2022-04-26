//
//  NotificationsModel.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 14/04/22.
//

import Foundation
import UIKit

class NotificationModel {
    
    
    var message : String
    var notifyTime: String
    var notificationImageIcon: UIImage
    
    init(message :String, notifyTime: String, notificationImageIcon: UIImage) {
        
        self.message = message
        self.notifyTime = notifyTime
        self.notificationImageIcon = notificationImageIcon
        
    }
    
}

