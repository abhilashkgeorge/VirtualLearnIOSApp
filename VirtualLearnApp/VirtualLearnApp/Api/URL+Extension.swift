//
//  URL+Extension.swift
//  VirtualLearnApp
//
//  Created by Anushree on 09/04/22.
//

import Foundation
extension URL {
    
    static func fetchURLForSendOTPToRegister() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/register/sendOtp") else {
            fatalError("Error getting URL")
        }
        return url
    }
    
    static func fetchURLForVerifyOTPToRegister() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/register/verfiyOtp") else {
            fatalError("Error getting URL")
        }
        return url
    }
    
    static func fetchURLForuserLogin() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/login/user") else {
            fatalError("Error getting URL")
        }
        return url
    }
    
    static func fetchURLForRegistration() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/userRegistration") else {
            fatalError("Error getting URL")
        }
        return url
    }
    
    static func fetchURLForMyProfile() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/myProfile") else {
            fatalError("Error getting URL")
        }
        return url
    }
    
    static func fetchURLForSearch() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/search") else {
            fatalError("Error getting URL")
        }
        return url
    }
    
    static func fetchURLForEditProfile() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/editProfile") else {
            fatalError("Error getting URL")
        }
        return url
    }
    
    static func fetchURLForMyCourses() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/myCourse") else {
            fatalError("Error getting URL")
        }
        return url
    }
    
    static func fetchURLForHomePage() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/home/user") else {
            fatalError("Error getting Home URL")
        }
        return url
    }
    
    static func fetchURLForForgotPasswordSndOTP() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/forgot_password/sendOtp") else {
            fatalError("Error getting Home URL")
        }
        return url
    }
    
    static func fetchURLForChangePassword() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/myProfile/changePassword") else {
            fatalError("Error getting Home URL")
        }
        return url
    }
    
    static func fetchURLForForgotPasswordVerifyOTP() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/forgot_password/verifyOtp") else {
            fatalError("Error getting Home URL")
        }
        return url
    }
    
    static func fetchURLForHome() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/home/user") else {
            fatalError("Error getting Home URL")
        }
        return url
    }
    
    static func fetchURLForForgotPasswordReset() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/forgot_password/resetPassword") else {
            fatalError("Error getting Home URL")
        }
        return url
    }
    
    static func fetchURLForOverview(courseID: String, courseTitle: String) -> URL {
        let originalString = "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/viewCourse?courseName=\(courseTitle)&courseId=\(courseID)"
        guard let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            fatalError("original failed")
            
        }
        guard let url = URL(string: urlString) else {
            fatalError("main url failed")
        }
        return url
    }
    
    static func fetchURLForLogout() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/logout")else {
            fatalError("Error getting Home URL")
        }
        return url
    }
    
    static func fetchURLForJoinCourse(courseID: String, courseTitle: String) -> URL {
        let originalString = "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/user/joinCourse?courseName=\(courseTitle)&courseId=\(courseID)"
        
        guard let urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            fatalError("original failed")
        }
        guard let url = URL(string: urlString) else {
            fatalError("main url failed")
        }
        return url
    }
    
    
    static func fetchURLForNotifications() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/notification") else {
            fatalError("Error getting URL")
        }
        return url
        
    }
    
    static func fetchURLForTestUserAnswer() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/myCourse/test/userAnswer") else {
            fatalError("Error getting URL")
        }
        return url
    }
    
    static func fetchURLForChapterTest(id: String, chapterNumber: Int) -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/myCourse/test/test_Chapter?courseId=\(id)&chapterNumber=\(chapterNumber)") else {
            fatalError("Error getting url")
        }
        return url
    }
    
    static func fetchURLForUserMarkedAnswer(id: String) -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/myCourse/test/getUserAnswerInTest?courseId=\(id)") else {
            fatalError("Error getting url")
        }
        return url
    }
    
    static func fetchURLForUpdateFinalGrade(id: String) -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/myCourse/test/UpdateFinalGrade?courseId=\(id)") else {
            fatalError("Error getting url")
        }
        return url
    }
    
    static func fetchURLForAnswerKey(testId: String) -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/myCourse/test/testAnswers?testId=\(testId)") else {
            fatalError("Error getting url")
        }
        return url
    }
    
    static func fetchURLForFinalGrade(id: String) -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/myCourse/test/UpdateFinalGrade?courseId=\(id)") else {
            fatalError("Error getting url")
        }
        return url
    }
    
}


