//
//  ChaptersViewModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 24/04/22.
//

import Foundation

class ChaptersViewModel {
    
    var allChapters = [ChapterDataModel]()
    var allSubChapters = [SubChaptersDataModel]()
    
    let manager = OverviewNetworkManager()
    let imageApi = ApiImage()
    
    func serializeChaptersDetails(json: Any) -> [ChapterDataModel] {
        
        let jsonData = json as? [String: AnyObject]
        let chapters = jsonData!["chapters"] as? [[String: Any]] ?? [["chapters": "error"]]
        
        for chapter in chapters {
            let subChapters = chapter["serialNumber"] as? [[String: Any]] ?? [["Sub chapters": "error"]]
            let number = chapter["chapterNo"] as? Int ?? 0
            let name = chapter["chapterName"]  as? String ?? "No chapter name"
            let id = chapter["_id"] as? String ?? "No chapter id"
            let testID = chapter["testId"] as? String ?? "No test ID"        
            let course = ChapterDataModel(chapterNo: number, chapterName: name, chapterID: id, testID: testID, subChapterCount: subChapters.count)
            allChapters.append(course)
        }
        print("All chapters from api")
        print(allChapters[0].chapterName)
        return allChapters
    }
    
    func chapterDetail(name: String, id: String, completionHandler: @escaping (_ chapters: [ChapterDataModel]) -> Void) {
        
        let url = URL.fetchURLForOverview(courseID: id, courseTitle: name)

        manager.courseOverview(url: url, completionHandler:
                                {
                                    (json: Any) -> Void
                                    in
                                    let details = self.serializeChaptersDetails(json: json)
                                    completionHandler(details)
                }
        )
    }
    
    func serializeSubChapters(json: Any) -> [SubChaptersDataModel] {
        
        let jsonData = json as? [String: AnyObject]
        let chapters = jsonData!["chapters"] as? [[String: Any]] ?? [["chapters": "error"]]
        
        for chapter in chapters {
            
            let chapterNumber = chapter["chapterNo"] as? Int ?? 0
            let subChapters = chapter["serialNumber"] as? [[String: Any]] ?? [["Sub chapters": "error"]]
            
            for eachSubChapter in subChapters {
                
                let subChapterNumber = eachSubChapter["number"] as? Int ?? 0
                let videoName = eachSubChapter["videoName"] as? String ?? ""
                let videoLink = eachSubChapter["videoLink"] as? String ?? ""
                let videoLength = eachSubChapter["duration"] as? Int ?? 0
                let pausedTime = eachSubChapter["pausedTime"] as? String ?? ""
                let subChapterID = eachSubChapter["_id"] as? String ?? ""
                
                let subChapter = SubChaptersDataModel(chapterNo: chapterNumber, serialNumber: subChapterNumber, videoName: videoName, videoLink: videoLink, videoDuration: videoLength, videoPausedTime: pausedTime, serialNumberID: subChapterID)
                allSubChapters.append(subChapter)
            }
        }
        print("All sub chapters from api: \(allSubChapters.count)")
        return allSubChapters
    }
    
    func subChapterDetail(name: String, id: String, completionHandler: @escaping (_ chapters: [SubChaptersDataModel]) -> Void) {
        
        let url = URL.fetchURLForOverview(courseID: id, courseTitle: name)

        manager.courseOverview(url: url, completionHandler:
                                {
                                    (json: Any) -> Void
                                    in
                                    let details = self.serializeSubChapters(json: json)
                                    completionHandler(details)
                }
        )
    }
    
}
