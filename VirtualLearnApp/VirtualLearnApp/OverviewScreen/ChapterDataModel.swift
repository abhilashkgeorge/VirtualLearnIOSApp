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
    var subChapterCount: Int
    
    init(chapterNo: Int, chapterName: String, chapterID: String, testID: String, subChapterCount: Int ) {
        
        self.chapterNo = chapterNo
        self.chapterName = chapterName
        self.chapterID = chapterID
        self.testID = testID
        self.subChapterCount = subChapterCount
        
    }
}

class ChapterAndSubChapters {
   
    var chapterDetail: ChapterDataModel
    var subChaptersDetails: [SubChaptersDataModel]
    
    init(chapterDetail: ChapterDataModel, subChaptersDetails: [SubChaptersDataModel]) {
        
        self.chapterDetail = chapterDetail
        self.subChaptersDetails = subChaptersDetails
    }
    
}

