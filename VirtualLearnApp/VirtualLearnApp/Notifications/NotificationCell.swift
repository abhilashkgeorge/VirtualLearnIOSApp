//
//  NotificationCell.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 12/04/22.
//

import UIKit

class NotificationCell: UITableViewCell {
    
    static let identifier = "notificationCell"
    
    @IBOutlet weak var notifyImageView: NotificationImageView!
    @IBOutlet weak var notifyMessageLabel: NotificationMessageLabel!
    @IBOutlet weak var notificationTimeLabel: NotificationTimeLabel!
    @IBOutlet weak var unopenedIndication: UnopenedNotificationIndicator!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let screenSize = UIScreen.main.bounds
        let separatorHeight = CGFloat(15.0)
        let additionalSeparator = UIView.init(frame: CGRect(x: 0, y: self.frame.size.height-separatorHeight, width: screenSize.width, height: separatorHeight))
        additionalSeparator.backgroundColor = UIColor.clear
        self.addSubview(additionalSeparator)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNotifications(notification: Notifications) {
        notifyImageView.image = notification.image
        notifyMessageLabel.text = notification.message
        notificationTimeLabel.text = notification.time
    }


}

