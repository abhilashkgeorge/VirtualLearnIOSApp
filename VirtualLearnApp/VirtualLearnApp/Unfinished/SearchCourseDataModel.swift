//
//  SearchCourseDataModel.swift
//  VirtualLearnApp
//
//  Created by Anusha on 16/04/22.
//

import Foundation
import UIKit

class SearchCourseDataModel {
    
    var name: String
    var totalChapters: Int
    var category: String
    var courseImage: UIImage
    
    init(name: String,totalChapters: Int,category: String,courseImage: UIImage) {
        
        self.name = name
        self.totalChapters = totalChapters
        self.category = category
        self.courseImage = courseImage
    }
    
}
