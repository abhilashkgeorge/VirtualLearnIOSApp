//
//  ProfileDataModel.swift
//  VirtualLearnApp
//
//  Created by Anushree on 13/04/22.
//

import Foundation

class ProfileDataModel {
    
    var fullName: String
    var userName: String
    var email: String
    var mobileNumber: String
    var occupation: String
    var gender: String
    var dob: String
    var twitterLink: String
    var facebookLink: String
    var courses: Int
    var chapters: Int
    var tests: Int
    
    init(fullName: String, userName: String, email: String, mobileNumber: String, occupation: String, gender: String, dob: String, twitterLink: String, facebookLink: String, courses: Int, chapters: Int, tests: Int) {
        
        self.fullName = fullName
        self.userName = userName
        self.email = email
        self.mobileNumber = mobileNumber
        self.occupation = occupation
        self.gender = gender
        self.dob = dob
        self.twitterLink = twitterLink
        self.facebookLink = facebookLink
        self.courses = courses
        self.chapters = chapters
        self.tests = tests
    }
}
