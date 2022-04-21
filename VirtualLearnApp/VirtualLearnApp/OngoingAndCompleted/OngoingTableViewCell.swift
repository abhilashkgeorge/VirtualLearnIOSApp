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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func continueTapped(_ sender: Any) {
    }
}
