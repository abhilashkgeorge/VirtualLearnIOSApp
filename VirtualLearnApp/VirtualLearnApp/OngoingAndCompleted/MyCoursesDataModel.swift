//
//  MyCoursesDataModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 15/04/22.
//

import Foundation
import UIKit

class MyCoursesDataModel {
    
    var courseName: String
    var courseID: String
    var courseImage: UIImage
    
    init(courseName: String, courseID: String, courseImage: UIImage) {
        
        self.courseName = courseName
        self.courseID = courseID
        self.courseImage = courseImage
    }
}
