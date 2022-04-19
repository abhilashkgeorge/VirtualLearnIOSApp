//
//  MyCoursesViewModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 15/04/22.
//

import Foundation
import UIKit

class MyCoursesViewModel {
    
    let manager = MyCoursesNetworkManager()
    let imageApi = ApiImage()
    var ongoingCourses = [MyCoursesDataModel]()
    var completedCourses = [MyCoursesDataModel]()
    
    func ongoingCourseSerialize(json: Any)-> [MyCoursesDataModel] {
        
        var name: String = ""
        var id: String = ""
        var img: String = ""
        var picture = UIImage()
        
        let jsonData = json as? [String: Any]
        let ongoing = jsonData!["onGoingCourses"] as? [[String: String]] ?? [["ongoing": "error"]]
        
        for item in ongoing {
            name = item["courseName"] ?? "No ongoing course name"
            id = item["courseId"] ?? "No ongoing course id"
            img = item["courseImg"] ?? "No ongoing course image"
        
            imageApi.getImgFromApi(url: img) { (image) in
                picture = image
            }
            
            let eachOngoingCourse = MyCoursesDataModel(courseName: name, courseID: id, courseImage: picture)
            ongoingCourses.append(eachOngoingCourse)
            
        }
        return ongoingCourses
    }
    
    func ongoingUserCourses(completionHandler: @escaping (_ profile: [MyCoursesDataModel]) -> Void) {
        
        manager.userMyCourses(completionHandler:
                                {
                                    (json: Any) -> Void
                                    in
                                    let course = self.ongoingCourseSerialize(json: json)
                                    completionHandler(course)
                }
        )
    }
    
    func completedCourseSerialize(json: Any)-> [MyCoursesDataModel] {
        
        var name: String = ""
        var id: String = ""
        var img: String = ""
        var picture = UIImage()
        
        let jsonData = json as? [String: Any]
        let completed = jsonData!["completedCourse"] as? [[String: String]] ?? [["ongoing": "error"]]
        
        for item in completed {
            name = item["courseName"] ?? "No ongoing course name"
            id = item["courseId"] ?? "No ongoing course id"
            img = item["courseImg"] ?? "No ongoing course image"
            
            imageApi.getImgFromApi(url: img) { (image) in
                picture = image
            }
            
            let eachCompletedCourse = MyCoursesDataModel(courseName: name, courseID: id, courseImage: picture)
            completedCourses.append(eachCompletedCourse)
            
        }
        return completedCourses
    }
    
    func completedUserCourses(completionHandler: @escaping (_ profile: [MyCoursesDataModel]) -> Void) {
        
        manager.userMyCourses(completionHandler:
                                {
                                    (json: Any) -> Void
                                    in
                                    let course = self.completedCourseSerialize(json: json)
                                    completionHandler(course)
                }
        )
    }
}
