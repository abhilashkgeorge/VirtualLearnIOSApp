//
//  HomeViewModel.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 14/04/22.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var title = ""
    var category = ""
    var chapters = 0
    var imageString = ""
    var courseImage = UIImage()
    var allUserCourses = [HomeModel]()
    var userPopularCourses = [HomeModel]()
    
    let manager = HomeNetworkManager()
    let imageApi = ApiImage()
    
    func ongoingCourseCount (completionHandler: @escaping (_ coursesCount: Int) -> Void) {
        
        manager.userHomeScreen(completionHandler:
                                {
                                    (json: Any) -> Void
                                    in
                                    let jsonData = json as? [String: Any]
                                    let ongoingCourses = jsonData!["ongoingCourses"] as? [[String: String]] ?? [["ongoing": "error"]]
                                    completionHandler(ongoingCourses.count)
                                    
                                })
    }
    
    func serializeAllCourses(json: Any)-> [HomeModel] {
        
        let jsonData = json as? [String: Any]
        let allCourses = jsonData!["allCourses"] as? [[String: Any]] ?? [["All Courses": "error"]]
        
        for course in allCourses {
            
            title = course["courseName"] as? String ?? "No all course name"
            category = course["category"] as? String ?? "No all course category"
            chapters = course["totalChapters"] as? Int ?? 0
            imageString = course["courseImg"] as? String ?? "No all course image"
            
            imageApi.getImgFromApi(url: imageString) { (image) in
                self.courseImage = image
            }
            
            let eachAllCourse = HomeModel(courseTitle: title, courseCategory: category, noOfChapters: chapters, courseImage: courseImage)
            allUserCourses.append(eachAllCourse)
        }
        print(allUserCourses[0].courseTitle)
        return allUserCourses
    }
    
    func homeScreenAllCourses(completionHandler: @escaping (_ courses: [HomeModel]) -> Void) {
        
        manager.userHomeScreen (completionHandler:
                                    {
                                        (json: Any) -> Void
                                        in
                                        let course = self.serializeAllCourses(json: json)
                                        completionHandler(course)
                                    }
        )
    }
    
    func serializePopularCourses(json: Any)-> [HomeModel] {
        
        let jsonData = json as? [String: Any]
        let popularCourses = jsonData!["popular"] as? [[String: Any]] ?? [["Popular Courses": "error"]]
        
        for course in popularCourses {
            
            title = course["courseName"] as? String ?? "No popular course name"
            category = course["category"] as? String ?? "No popular course category"
            chapters = course["totalChapters"] as? Int ?? 0
            imageString = course["courseImg"] as? String ?? "No popular course image"
            
            imageApi.getImgFromApi(url: imageString) { (image) in
                self.courseImage = image
            }
            
            let eachPopularCourse = HomeModel(courseTitle: title, courseCategory: category, noOfChapters: chapters, courseImage: courseImage)
            userPopularCourses.append(eachPopularCourse)
        }
        print(userPopularCourses[0].courseTitle)
        return userPopularCourses
    }
    
    func homeScreenPopularCourses(completionHandler: @escaping (_ courses: [HomeModel]) -> Void) {
        
        manager.userHomeScreen(completionHandler:
                                {
                                    (json: Any) -> Void
                                    in
                                    let course = self.serializePopularCourses(json: json)
                                    completionHandler(course)
                                }
        )
    }
    
}
