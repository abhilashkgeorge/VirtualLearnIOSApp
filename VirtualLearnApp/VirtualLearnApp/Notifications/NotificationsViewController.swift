//
//  NotificationsViewController.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 12/04/22.
//
import Foundation
import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var notifications: [Notifications] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        notifications = createArray()
    }
    
    func createArray() -> [Notifications]{
        
        let notify1 = Notifications(image: #imageLiteral(resourceName: "img_notify message_dp1"), message: "You scored 80% in Chapter 3 - Setting up a new project, of Course - Learn Figma - UI/UX Design Essential Training.", time: "2 min ago")
        let notify2 = Notifications(image: #imageLiteral(resourceName: "img_notify message_dp1"), message: "Completed Chapter 3 - Setting up a new project, of Course - Learn Figma - UI/UX Design Essential Training.", time: "5 min ago")
        let notify3 = Notifications(image: #imageLiteral(resourceName: "Circle"), message: "Successfully changed your Password", time: "1 hour ago")
        let notify4 = Notifications(image: #imageLiteral(resourceName: "img_notify message_dp2"), message: "Joined a New Course - Art & Illustration ", time: "yesterday")
        let notify5 = Notifications(image: #imageLiteral(resourceName: "icn_notification_notify-Megaphone"), message: "Hay Msdian, There is a new course about Art & Illustration added to the topic Design", time: "yesterday")

        return [notify1,notify2,notify3,notify4,notify5]
    }
    
    

}

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notification = notifications[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationCell
        
        cell.setNotifications(notification: notification)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
         return 114
    }
    
}

class Notifications {
    
    var image: UIImage
    var message: String
    var time: String
    
    init(image: UIImage,message: String, time: String) {
        self.image = image
        self.message = message
        self.time = time
    }

}
