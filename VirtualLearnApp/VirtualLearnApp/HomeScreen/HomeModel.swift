//
//  HomeModel.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 14/04/22.
//


import Foundation
import  UIKit

class HomeModel {
    
    var courseTitle: String
    var courseCategory: String
    var noOfChapters: Int
    var courseImage: UIImage
    
    init(courseTitle: String, courseCategory: String, noOfChapters: Int, courseImage: UIImage) {
        
        self.courseTitle = courseTitle
        self.courseCategory = courseCategory
        self.noOfChapters = noOfChapters
        self.courseImage = courseImage
    }
}
