//
//  ChapterCourseTableViewCell.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 21/04/22.
//

import UIKit

class ChapterCourseTableViewCell: UITableViewCell {

    
    //MARK: chapter cell
    @IBOutlet weak var firstCellChapterNumber: UILabel!
    @IBOutlet weak var firstCellTitle: UILabel!
    @IBOutlet weak var firstCellDuration: UILabel!
    @IBOutlet weak var firstCellPlayButton: UIButton!
    @IBOutlet weak var firstCellStatusCheckMarkImage:
        UIImageView!
    
   // MARK: Second cell
    @IBOutlet weak var testLogo: UIButton!
    @IBOutlet weak var secondCellDurationQnCount: UILabel!
    @IBOutlet weak var secondCellTitle: UILabel!
    @IBOutlet weak var approvalPercentage: UILabel!
    
    @IBOutlet weak var secondCellStatusCheckMarkImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
