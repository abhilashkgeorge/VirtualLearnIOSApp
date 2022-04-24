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
    
    static func fetchURLForLogout() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/logout")else {
            fatalError("Error getting Home URL")
        }
        return url
    }
}

