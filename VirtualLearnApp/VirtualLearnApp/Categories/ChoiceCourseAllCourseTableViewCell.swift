//
//  ChoiceCourseAllCourseTableViewCell.swift
//  VirtualLearnApp
//
//  Created by Anusha on 21/04/22.
//

import UIKit

class ChoiceCourseAllCourseTableViewCell: UITableViewCell {

    @IBOutlet weak var tableImage: UIImageView!
    @IBOutlet weak var tableCourseName: NotificationMessageLabel!
    @IBOutlet weak var tableChapters: UILabel!
    @IBOutlet weak var tableCategory: UILabel!
    
    func setStyling() {
        
        self.tableImage.layer.masksToBounds = true
        self.tableImage.layer.cornerRadius = self.tableImage.frame.width/5.0
        tableCategory.layer.masksToBounds = true
        tableCategory.layer.cornerRadius = 3
    
    }
}
