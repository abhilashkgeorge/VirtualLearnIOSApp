//
//  ProfileViewModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 13/04/22.
//

import Foundation
import UIKit

class ProfileViewModel {
    
    let manager = ProfileNetworkManager()
    let imageApi = ApiImage()
    
    func profileSerialization(json: Any) -> ProfileDataModel {
        
        var picture = UIImage()
        
        let newJson = json as? [String: AnyObject]
        let name = newJson!["fullName"] as? String ?? "no name"
        let username = newJson!["userName"] as? String ?? "no username"
        let emailID = newJson!["email"] as? String ?? "no email"
        let mobilenumber = newJson!["phone"] as? String ?? "no username"
        let occupation = newJson!["occupation"] as? String ?? "no occupation details"
        let gender = newJson!["gender"] as? String ?? "no gender details"
        let dob = newJson!["dob"] as? String ?? "no DOB details"
        let twitterlink = newJson!["twitterLink"] as? String ?? "no twitter link"
        let facebooklink = newJson!["facebookLink"] as? String ?? "no facebook link"
        let coursesCompleted = newJson!["course"] as? Int ?? 0
        let chaptersCompleted = newJson!["chapters"] as? Int ?? 0
        let testsCompleted = newJson!["testCompleted"] as? Int ?? 0
        let profilePic = newJson!["profilePicture"] as? String ?? "no image"
        
        imageApi.getImgFromApi(url: profilePic) { (image) in
            picture = image
        }
        
        let profile = ProfileDataModel(fullName: name, userName: username, email: emailID, mobileNumber: mobilenumber, occupation: occupation, gender: gender, dob: dob, twitterLink: twitterlink, facebookLink: facebooklink, courses: coursesCompleted, chapters: chaptersCompleted, tests: testsCompleted, profileImage: picture)
        
        return profile
    }
    
    func myProfile(completionHandler: @escaping (_ profile: ProfileDataModel ) -> Void) {
        manager.userProfile(completionHandler:
                                {
                                    (json: Any) -> Void
                                    in
                                    let details = self.profileSerialization(json: json)
                                    completionHandler(details)
                                }
        )
    }
    
    func editUserProfile(email: String, occupation: String, gender: String, dob: String, twitterLink: String, facebookLink: String, completionHandler: @escaping (_ successMessage: String) -> Void) {
        
        manager.editProfile(email: email, occupation: occupation, gender: gender, dob: dob, twitterLink: twitterLink, facebookLink: facebookLink, completionHandler: {
            
            (json: String?) -> Void
                in
            print("Message:\(String(describing: json))")
            completionHandler(json ?? "no message")
          
        })
    }
}
