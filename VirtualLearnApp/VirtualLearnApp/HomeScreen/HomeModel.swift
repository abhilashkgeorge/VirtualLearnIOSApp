//
//  HomeModel.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 14/04/22.
//


import Foundation
import  UIKit

class HomeModel {
    
    var id: String
    var courseTitle: String
    var courseCategory: String
    var noOfChapters: Int
    var courseImage: UIImage
    
    init(id: String, courseTitle: String, courseCategory: String, noOfChapters: Int, courseImage: UIImage) {
        
        self.id = id
        self.courseTitle = courseTitle
        self.courseCategory = courseCategory
        self.noOfChapters = noOfChapters
        self.courseImage = courseImage
    }
}
