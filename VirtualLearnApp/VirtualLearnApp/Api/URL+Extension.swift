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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    static func fetchURLForHomePage() -> URL {
        
        guard let url = URL(string: "https://virtuallearn2.herokuapp.com/api/v1/virtualLearn/home/user") else {
            fatalError("Error getting Home URL")
        }
    return url
}
}

