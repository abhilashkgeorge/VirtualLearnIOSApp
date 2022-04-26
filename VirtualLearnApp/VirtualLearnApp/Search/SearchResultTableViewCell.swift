//
//  SearchResultTableViewCell.swift
//  VirtualLearnApp
//
//  Created by Anusha on 16/04/22.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var courseName: NotificationMessageLabel!
    @IBOutlet weak var courseNoChapters: UILabel!
    @IBOutlet weak var courseCategory: UILabel!
    
    func setStyling() {
        
        self.courseImage.layer.masksToBounds = true
        self.courseImage.layer.cornerRadius = self.courseImage.frame.width/5.0
        courseCategory.layer.masksToBounds = true
        courseCategory.layer.cornerRadius = 3
    
    }
}
