//
//  SubChaptersDataModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 24/04/22.
//

import Foundation

class SubChaptersDataModel {
    
    var chapterNo : Int
    var serialNumber: Int
    var videoName: String
    var videoLink: String
    var videoDuration: Int
    var videoPausedTime: String
    var serialNumberID: String
    
    init(chapterNo : Int, serialNumber: Int, videoName: String, videoLink: String, videoDuration: Int, videoPausedTime: String, serialNumberID: String) {
        
        self.chapterNo = chapterNo
        self.serialNumber = serialNumber
        self.videoName = videoName
        self.videoLink = videoLink
        self.videoDuration = videoDuration
        self.videoPausedTime = videoPausedTime
        self.serialNumberID = serialNumberID
        
    }
}
