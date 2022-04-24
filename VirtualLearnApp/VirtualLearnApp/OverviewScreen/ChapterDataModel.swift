//
//  ChapterDataModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 24/04/22.
//

import Foundation

class ChapterDataModel {
    
    var chapterNo: Int
    var chapterName: String
    var chapterID: String
    var testID: String
    
    init(chapterNo: Int, chapterName: String, chapterID: String, testID: String) {
        
        self.chapterNo = chapterNo
        self.chapterName = chapterName
        self.chapterID = chapterID
        self.testID = testID
        
    }
}
