//
//  NotificationsViewModel.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 13/04/22.
//

import Foundation
class NotificationsViewModel {
    
    let manager = NotificationsNetworkManager()
    
    func notificationSerialization(json: Any) -> NotificationModel {
        
        let notifyJson = json as? [String: AnyObject]
        let message = notifyJson!["message"] as? String ?? "no message"
        let time = notifyJson!["time"] as? String ?? "no time"
        let notificationIsOpen = notifyJson!["notificationIsOpen"] as? Bool ?? false
        
        let notification = NotificationModel(message: message, notifyTime: time, notificationIsOpen: notificationIsOpen)
        return notification
    }
    
    func myProfile(completionHandler: @escaping (_ profile: NotificationModel ) -> Void) {
        manager.userNotifications(completionHandler:
                                {
                                    (json: Any) -> Void
                                    in
                                    let notification = self.notificationSerialization(json: json)
                                    completionHandler(notification)
                                }
        )
    }
}
