//
//  URLRequest+Extension.swift
//  VirtualLearnApp
//
//  Created by Anusha on 09/04/22.
//

import Foundation

extension URLRequest {
    
    static var token: String = ""
    static var tokenForRegistration: String = ""
    static var commonToken: String = ""
    
    static func postRequestForSendOTPToRegisterAndUserLogin(url: URL,body: [String: String]) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    static func postRequestForVerifyOTPToRegister(url: URL,body: [String: String]) -> URLRequest {

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch let error {
            print(error.localizedDescription)
        }
        print("verifyotpToken:\(token)")
        request.setValue("jwt \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    static func postRequestForUserRegistration(url: URL,body: [String: String]) -> URLRequest {

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch let error {
            print(error.localizedDescription)
        }
        print("verifyotpToken:\(tokenForRegistration)")
        request.setValue("jwt \(tokenForRegistration)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    static func getRequestForMyProfile(url: URL) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        print("viewModel:\(commonToken)")
        request.setValue("jwt \(commonToken)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    static func postRequestForSearch(url: URL,body: [String: Any]) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch let error {
            print(error.localizedDescription)
        }
        print("sarchRequest:\(commonToken)")
        request.setValue("jwt \(commonToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }

    static func postRequestForEditProfile(url: URL,body: [String: String]) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch let error {
            print(error.localizedDescription)
        }
        print("edit profile token \(commonToken)")

        request.setValue("jwt \(commonToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
   
    static func getRequestForMyCourses(url: URL) -> URLRequest {
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            print("Token for my courses \(commonToken)")
            request.setValue("jwt \(commonToken)", forHTTPHeaderField: "Authorization")
            return request
        }
        
    static func getRequestForHome(url: URL) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"   
            
        request.setValue("jwt \(commonToken)", forHTTPHeaderField: "Authorization")
        return request
    }
}
