//
//  HomeViewModel.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 14/04/22.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var id = ""
    var title = ""
    var category = ""
    var chapters = 0
    var imageString = ""
    var courseImage = UIImage()
    
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
        
        var allUserCourses = [HomeModel]()
        
        let jsonData = json as? [String: Any]
        let allCourses = jsonData!["allCourses"] as? [[String: Any]] ?? [["All Courses": "error"]]
        
        for course in allCourses {
            
            id = course["_id"] as? String ?? "No all course ID"
            title = course["courseName"] as? String ?? "No all course name"
            category = course["category"] as? String ?? "No all course category"
            chapters = course["totalChapters"] as? Int ?? 0
            imageString = course["courseImg"] as? String ?? "No all course image"
            
            imageApi.getImgFromApi(url: imageString) { (image) in
                self.courseImage = image
            }
            
            let eachAllCourse = HomeModel(id: id, courseTitle: title, courseCategory: category, noOfChapters: chapters, courseImage: courseImage)
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
        
        var userPopularCourses = [HomeModel]()
        
        let jsonData = json as? [String: Any]
        let popularCourses = jsonData!["popular"] as? [String: Any] ?? ["Popular Courses": "error"]
        
        let designCourses = popularCourses["Design"] as? [[String: Any]] ?? [["Design courses": "error"]]
        
        for eachCourse in designCourses {
            
            id = eachCourse["_id"] as? String ?? "No design course ID"
            title = eachCourse["courseName"] as? String ?? "No design course name"
            category = eachCourse["category"] as? String ?? "No design course category"
            chapters = eachCourse["totalChapters"] as? Int ?? 0
            imageString = eachCourse["courseImg"] as? String ?? "No design course image"
            
            imageApi.getImgFromApi(url: imageString) { (image) in
                self.courseImage = image
            }
            
            let eachPopularCourse = HomeModel(id: id, courseTitle: title, courseCategory: category, noOfChapters: chapters, courseImage: courseImage)
            print(eachPopularCourse.courseTitle)
            userPopularCourses.append(eachPopularCourse)
        }
        
        let developmentCourses = popularCourses["Development"] as? [[String: Any]] ?? [["Development courses": "error"]]
        
        for eachCourse in developmentCourses {
            
            id = eachCourse["_id"] as? String ?? "No development course ID"
            title = eachCourse["courseName"] as? String ?? "No development course name"
            category = eachCourse["category"] as? String ?? "No development course category"
            chapters = eachCourse["totalChapters"] as? Int ?? 0
            imageString = eachCourse["courseImg"] as? String ?? "No development course image"
            
            imageApi.getImgFromApi(url: imageString) { (image) in
                self.courseImage = image
            }
            
            let eachPopularCourse = HomeModel(id: id, courseTitle: title, courseCategory: category, noOfChapters: chapters, courseImage: courseImage)
            print(eachPopularCourse.courseTitle)
            userPopularCourses.append(eachPopularCourse)
        }
        
        let photographyCourses = popularCourses["Photography"] as? [[String: Any]] ?? [["Photography courses": "error"]]
        
        for eachCourse in photographyCourses {
            
            id = eachCourse["_id"] as? String ?? "No photography course ID"
            title = eachCourse["courseName"] as? String ?? "No photography course name"
            category = eachCourse["category"] as? String ?? "No photography course category"
            chapters = eachCourse["totalChapters"] as? Int ?? 0
            imageString = eachCourse["courseImg"] as? String ?? "No photography course image"
            
            imageApi.getImgFromApi(url: imageString) { (image) in
                self.courseImage = image
            }
            
            let eachPopularCourse = HomeModel(id: id, courseTitle: title, courseCategory: category, noOfChapters: chapters, courseImage: courseImage)
            print(eachPopularCourse.courseTitle)
            userPopularCourses.append(eachPopularCourse)
        }
        
        let lifeStyleCourses = popularCourses["Lifestyle"] as? [[String: Any]] ?? [["LifeStyle courses": "error"]]
        
        for eachCourse in lifeStyleCourses {
            
            id = eachCourse["_id"] as? String ?? "No lifeStyle course ID"
            title = eachCourse["courseName"] as? String ?? "No lifeStyle course name"
            category = eachCourse["category"] as? String ?? "No lifeStyle course category"
            chapters = eachCourse["totalChapters"] as? Int ?? 0
            imageString = eachCourse["courseImg"] as? String ?? "No lifeStyle course image"
            
            imageApi.getImgFromApi(url: imageString) { (image) in
                self.courseImage = image
            }
            
            let eachPopularCourse = HomeModel(id: id, courseTitle: title, courseCategory: category, noOfChapters: chapters, courseImage: courseImage)
            print(eachPopularCourse.courseTitle)
            userPopularCourses.append(eachPopularCourse)
        }
        
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
