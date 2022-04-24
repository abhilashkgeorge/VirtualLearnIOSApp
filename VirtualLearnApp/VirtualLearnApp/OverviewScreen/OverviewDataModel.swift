//
//  OverviewDataModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 23/04/22.
//

import Foundation
import UIKit

class OverviewDataModel {
    
    var overViewTitle: String
    var description: String
    var courseIncludes: [String]
    var learn: [String]
    var requirements: [String]
    var courseID: String
    var courseImage: UIImage
    var courseName: String
    var chapters: Int
    var category: String
    var instructorName: String
    var occupation: String
    var instructorDetails: String
    var profileImg: UIImage
    
    init(overViewTitle: String, description: String, courseIncludes: [String], learn: [String], requirements: [String], courseID: String, courseImage: UIImage, courseName: String, chapters: Int, category: String, instructorName: String, occupation: String, instructorDetails: String, profileImg: UIImage) {
        
        self.overViewTitle = overViewTitle
        self.description = description
        self.courseIncludes = courseIncludes
        self.learn = learn
        self.requirements = requirements
        self.courseID = courseID
        self.courseImage = courseImage
        self.courseName = courseName
        self.chapters = chapters
        self.category = category
        self.instructorName = instructorName
        self.occupation = occupation
        self.instructorDetails = instructorDetails
        self.profileImg = profileImg
        
    }
}
