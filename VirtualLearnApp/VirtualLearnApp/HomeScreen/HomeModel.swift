//
//  HomeModel.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 14/04/22.
//


import Foundation

// MARK: - Welcome
struct HomeModel {
    let data: DataClass
    let allCourses: [AllCourse]
}

// MARK: - DataClass
struct DataClass {
    let allCourses: [AllCourse]
    let profileStatus: ProfileStatus
    let categories: [String]
    let popular: [String]
}

// MARK: - AllCourse
struct AllCourse {
    let id, courseName: String
    let totalChapters: Int
    let category: String
    let courseImg: String
    let date: String
}

// MARK: - ProfileStatus
struct ProfileStatus {
    let message: String
    let status: Bool
}

