//
//  OverviewViewModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 23/04/22.
//

import Foundation
import UIKit

class OverviewViewModel {
    
    let manager = OverviewNetworkManager()
    let imageApi = ApiImage()
    
    func serializeOverviewDetails(json: Any) -> OverviewDataModel {
        
        var instructorName = ""
        var instructorDescription = ""
        var occupation = ""
        var courseImage = UIImage()
        var profileImage = UIImage()
        
        let newJson = json as? [String: AnyObject]
        let id = newJson!["_id"] as? String ?? "no course ID"
        let name = newJson!["courseName"] as? String ?? "no course name"
        let chapters = newJson!["totalChapters"] as? Int ?? 0
        let category = newJson!["category"] as? String ?? "no course category"
        let courseImageString = newJson!["courseImg"] as? String ?? "no image string"
        let overviewTitle = newJson!["overviewTitle"] as? String ?? "no overview title"
        let description = newJson!["description"] as? String ?? "no course description"
        let courseIncludes = newJson!["courseIncludes"] as? [String] ?? ["no course includes"]
        let learn = newJson!["learn"] as? [String] ?? ["no learning points"]
        let requirements = newJson!["requirements"] as? [String] ?? ["no requirements"]
        let instructorProfile = newJson!["instructor"] as? [[String: String]] ?? [["Instructor details": "error"]]
        
        imageApi.getImgFromApi(url: courseImageString) { (image) in
            courseImage = image
        }
        
        print(overviewTitle)
        
        for detail in instructorProfile {
            
            instructorName = detail["name"] ?? "No instructor name"
            occupation = detail["occupation"] ?? "No instructor job details"
            instructorDescription = detail["description"] ?? "No instructor description"
            let img = detail["profile"] ?? "No instructor image string"
            
            imageApi.getImgFromApi(url: img) { (image) in
                profileImage = image
            }
        }
        
        let overviewDetails = OverviewDataModel(overViewTitle: overviewTitle, description: description, courseIncludes: courseIncludes, learn: learn, requirements: requirements, courseID: id, courseImage: courseImage, courseName: name, chapters: chapters, category: category, instructorName: instructorName, occupation: occupation, instructorDetails: instructorDescription, profileImg: profileImage)
        
        return overviewDetails
    }

    func userCourseOverview(name: String, id: String, completionHandler: @escaping (_ profile: OverviewDataModel) -> Void) {
        
        let url = URL.fetchURLForOverview(courseID: id, courseTitle: name)

        manager.courseOverview(url: url, completionHandler:
                                {
                                    (json: Any) -> Void
                                    in
                                    let details = self.serializeOverviewDetails(json: json)
                                    completionHandler(details)
                }
        )
    }
    
}
