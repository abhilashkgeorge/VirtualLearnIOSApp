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
    
    func notificationsSerialize(json: Any)-> [NotificationModel] {
        
        var message: String = ""
        var notifyTime: String = ""
        var notifyImg: String = ""
        var notificationIcon = UIImage()
        
        let jsonData = json as? [String: Any]
        let ongoing = jsonData!["notifications"] as? [[String: String]] ?? [["ongoing": "error"]]
        
        for item in ongoing {
            message = item["message"] ?? "No message"
            notifyTime = item["notifyTime"] ?? "Time not known"
            notifyImg = item["notificationImageIcon"] ?? "No notification icon"
        
            imageApi.getImgFromApi(url: notifyImg) { (image) in
                notificationIcon = image
            }
            
            let notification = NotificationModel(message: message, notifyTime: notifyTime, notificationImageIcon: notificationIcon)
            notifications.append(notification)
            
        }
        return notifications
    }
    
    func ongoingUserCourses(completionHandler: @escaping (_ profile: [NotificationModel]) -> Void) {
        
        manager.userNotifications(completionHandler:
                                {
                                    (json: Any) -> Void
                                    in
                                    let course = self.notificationsSerialize(json: json)
                                    completionHandler(course)
                }
        )
    }
    
    
}
