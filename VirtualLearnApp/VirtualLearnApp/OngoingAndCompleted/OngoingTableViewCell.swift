//
//  OngoingTableViewCell.swift
//  VirtualLearnApp
//
//  Created by Anushree on 18/04/22.
//

import UIKit

class OngoingTableViewCell: UITableViewCell {
    
    static let identifier = "ongoingCourseCell"
    
    @IBOutlet weak var ongoingCourseImage: UIImageView!
    @IBOutlet weak var ongoingCourseName: UILabel!
    @IBOutlet weak var ongoingCourseChapters: UILabel!
    @IBOutlet weak var `continue`: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func continueTapped(_ sender: Any) {
    }
}
