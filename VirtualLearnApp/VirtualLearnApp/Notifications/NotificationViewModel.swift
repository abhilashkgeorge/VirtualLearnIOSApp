//
//  NotificationsViewModel.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 13/04/22.
//

import Foundation
import UIKit

class NotificationsViewModel {
    
    let manager = NotificationsNetworkManager()
    let imageApi = ApiImage()
    var notifications = [NotificationModel]()
    
    func notificationsSerialize(json: [[String: Any]])-> [NotificationModel] {
        
        var message: String = ""
        var notifyTime: String = ""
        var notifyImg: String = ""
        var notificationIcon = UIImage()
        
        let jsonData = json as? [[String: String]] ?? [["ongoing": "error"]]

        for item in jsonData {
            message = item["notificationMsg"] ?? "No message"
            notifyTime = item["createdAt"] ?? "Time not known"
            notifyImg = item["notificationicon"] ?? "No notification icon"
            
            imageApi.getImgFromApi(url: notifyImg) { (image) in
                notificationIcon = image
            }
            
            let notification = NotificationModel(message: message, notifyTime: notifyTime, notificationImageIcon: notificationIcon)
            notifications.insert(notification, at: 0)
            
       }
        return notifications
    }
    
    func ongoingUserCourses(completionHandler: @escaping (_ profile: [NotificationModel]) -> Void) {
        
        manager.userNotifications(completionHandler:
                                {
                                    (json: [[String: Any]]) -> Void
                                    in
                                    let course = self.notificationsSerialize(json: json)
                                    completionHandler(course)
                }
        )
    }
    
    func changingIsRead(index: Int) {
        notifications[index].isRead = true
    }
}
