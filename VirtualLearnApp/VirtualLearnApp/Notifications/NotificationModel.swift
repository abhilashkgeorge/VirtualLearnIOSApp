//
//  NotificationsModel.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 14/04/22.
//

import Foundation
import UIKit
struct NotificationModel: Equatable {
    
    
    var message :String
    var notifyTime: String
    var notificationIsOpen: Bool
//    var notificationImageIcon: UIImage
    
    init(message :String, notifyTime: String, notificationIsOpen: Bool){
        self.message = message
        self.notifyTime = notifyTime
        self.notificationIsOpen = notificationIsOpen
//        self.notificationImageIcon = notificationImageIcon
        
    }
    
}
