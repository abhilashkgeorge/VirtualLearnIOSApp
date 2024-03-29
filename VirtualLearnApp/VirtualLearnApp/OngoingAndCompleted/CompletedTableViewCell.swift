//
//  CompletedTableViewCell.swift
//  VirtualLearnApp
//
//  Created by Anushree on 18/04/22.
//

import UIKit

class CompletedTableViewCell: UITableViewCell {
    
    static let identifier = "completedCourseCell"

    @IBOutlet weak var completedCourseImage: UIImageView!
    @IBOutlet weak var completedCourseName: UILabel!
    @IBOutlet weak var approvalRate: UILabel!
    @IBOutlet weak var certificate: UIButton!
    
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

    @IBAction func viewCertificateTapped(_ sender: Any) {
    }
}
