//
//  QuestionResultCell.swift
//  VirtualLearnApp
//
//  Created by Prajna P on 27/04/22.
//

import UIKit

class QuestionResultCell: UITableViewCell {

    @IBOutlet weak var questionNo: UILabel!
    @IBOutlet weak var questionResult: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func viewResultOnClick(_ sender: Any) {
        
    }
    
    
}
